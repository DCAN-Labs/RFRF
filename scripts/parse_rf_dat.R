InputDataTypeEnum.gen <- setSingleEnum("InputDataType",
                                levels = c("ds", "pm"))

#' Parse input data and return user params, datatype, unformatted data
#' @return Returns missing data info, unformatted data, user inputs, data type in a list
#' @keywords parse
parse_rf_dat = function(data.path,
                       dat.type = c("ds", "pm"),
                       rm.dat = c("rm", "cs"),
                       outcome.var = NULL) {

  dat.type = match.arg(dat.type)
  rm.dat = match.arg(rm.dat)

  ######## read in data, validate, format ########
  if (dat.type == "ds") {
    input.dat = readr::read_csv(data.path, col_names = TRUE, col_types = cols())
    input.dat[,sapply(input.dat, is.character)] = lapply(input.dat[,sapply(input.dat, is.character)], factor)
    format.dat = data.frame(input.dat)
    outcome.var = ifelse(is.null(outcome.var),
                         names(format.dat)[1],
                         outcome.var)

  } else if (dat.type == "pm") {
    input.dat = readr::read_csv(data.path, col_names = FALSE, col_types = cols())

    if (check_num_mat(input.dat)) {
      format.dat = data.frame(input.dat)
      names(format.dat) = paste("sub", sprintf("%04d", c(1:ncol(format.dat))), sep="")
    } else {
      stop("Data type does not conform to package requirements - double check that data are numeric")
    }
  } else {
    stop("unspecified input data type ('ds' or 'pm')")
  }


  ######## check for missing data ########
  if (flag_missing_grtr_15per(format.dat, dim = "vars")[[1]]) {
    if (dat.type == "pm") {
      stop("halting program - missing data detected in proximity matrix")
    } else {
      if (flag_missing_grtr_15per(format.dat, , dim = "vars")[[1]]) {
        mask = flag_missing_grtr_15per(format.dat, dim = "vars")[[2]]
        warning(paste("The following variabes are missing more than 15% of their data: ", paste(names(format.dat)[mask], collapse=' '), sep=""))
      }

      if (flag_missing_grtr_15per(format.dat, dim = "subs")[[1]]) {
        mask = flag_missing_grtr_15per(format.dat, dim = "subs")[[2]]
        warning(paste("The following cases are missing more than 15% of their data: ", paste(which(mask), collapse=' '), sep=""))
      }
    }
  }
}
