#load libraries for diagram design
library(nomnoml)

#data flow diagram for RFRF
flow_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.fullbox: visual=ellipse
#.trainbox: #fill=#FFFF00 visual=ellipse
#.testbox: #fill=#00FFFF visual=ellipse
#.RFbox: #fill=#FFFFFF
#.proxmat: #fill=#FF007F visual=ellipse
#.subtype: #fill=#00FF00 visual=ellipse
[ <frame>RFRF flow diagram|
[<fullbox>Full Data] --:> [Holdout]
[Holdout] --:> [<trainbox>Train Data]
[Holdout] --:> [<testbox>Test Data]
[<trainbox>Train Data] --:> [cross-validation]
[cross-validation] cv folds --:> [<trainbox>Train Folds]
[cross-validation] --:> [<testbox>Valid Fold]
[Train Folds] tuning --:> [RF train]
[RF train] selection --:> [RF test]
[<testbox>Valid Fold] testing --:> [RF test]
[RF test] --:> [RF model]
[<trainbox>Train Data] train --:> [RF model]
[<testbox>Test Data] test --:> [RF model]
[RF model] --:> [<proxmat>proximity matrix]
[<proxmat>proximity matrix] --:> [subtype identification]
[subtype identification] --:> [<subtype>subtypes]
]"

#UML diagrams for RFRF

#Holdout diagram
#holdout takes in full datasets and produces a stratified holdout dataset and a train dataset
Holdout_UML_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#00FFFF
[<frame> Holdout UML Diagram|
[<databox>Input Data| file type: string
file name: string
file path: string]
[<databox>Input Data] -:> [Read File| open()
close()]
[Read File] -:> [<databox>Full Data| data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<databox>Full Data] -:> [Create Data Holdout| holdout fraction: 0-1
stratify by: string
even stratification: boolean | split_data()
stratify_data()
randomize()]
[Create Data Holdout] -:> [<databox>Train Data|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[Create Data Holdout] -:> [<databox>Test Data|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
]
"

#cross-validation diagram -- cross validation tak
#cross validation takes in a training dataset and produces stratified fold to send through RF_train and RF_test
CV_UMN_diagram="blah"
#RF train diagram
#RF train takes in training folds to produce RFs by different hyperparameters
RF_train_diagram="blah"
#RF test takes in testing folds to evaluate RFs by different hyperparameters
RF_test_diagram="blah"
#RF model diagram
#RF model takes in the training data and trains an RF using the
RF_model_diagram="blah"
subtype_ID_diagram="blah"

#interface diagram for RFRF
interface_diagram="blah"
#diagram visualization (saving may not work properly within RStudio)
nomnoml(code = flow_diagram,png='flow_diagram.png')
nomnoml(code = Holdout_UML_diagram,png='holdout_UML_diagram.png')
