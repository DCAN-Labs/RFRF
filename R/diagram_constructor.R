#load libraries for diagram design
library(nomnoml)

#data flow diagram for RFRF
flow_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.fullbox: #fill=#F5F5DC visual=ellipse
#.trainbox: #fill=#FFFF00 visual=ellipse
#.testbox: #fill=#00FFFF visual=ellipse
#.RFbox: #fill=#FFFFFF
#.proxmat: #fill=#FF007F visual=ellipse
#.subtype: #fill=#00FF00 visual=ellipse
[<frame>RFRF flow diagram|
[<fullbox>Full Data] --:> [holdout]
[holdout] --:> [<trainbox>Train Data]
[holdout] --:> [<testbox>Test Data]
[<trainbox>Train Data] --:> [cross_validation]
[cross_validation] --:> [<trainbox>Train Folds]
[cross_validation] --:> [<testbox>Valid Fold]
[Train Folds] tuning --:> [RF_train]
[RF_train] selection --:> [RF_test]
[<testbox>Valid Fold] testing --:> [RF_test]
[RF_test] --:> [RF_model]
[<trainbox>Train Data] train --:> [RF_model]
[<testbox>Test Data] test --:> [RF_model]
[RF_model] --:> [<proxmat>RF_prediction]
[<proxmat>RF_prediction] proximity_matrix --:> [Subtype_ID]
[Subtype_ID] --:> [<subtype>subtypes]
]"

#UML diagrams for RFRF

#holdout diagram
#holdout takes in full datasets and produces a holdout test dataset and a train dataset
holdout_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.fullbox: #fill=#F5F5DC visual=ellipse
#.inputbox: #fill=#F5F5DC
#.databox: #fill=#00FFFF
#.trainbox: #fill=#FFFF00
[<frame> holdout diagram|
[<fullbox>Full Data] -:> [read_file| file_type: string
file_name: string
file_path: string | open()
close()]
[read_file] -:> [<inputbox>Input Data| data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<inputbox>Input Data] -:> [holdout| data: Input Data
seed: int
groups: string
holdout_fraction: 0-1
even_stratification: boolean | randomize()
stratify_data()
split_data()]
[holdout] -:> [<trainbox>Train Data|  data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[holdout] -:> [<databox>Test Data|  data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
]"

#cross_validation diagram
#cross validation takes in a training dataset and produces stratified folds to send through RF_train and RF_test
cross_validation_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#FFFF00
#.testbox: #fill=#00FFFF
[<frame> cross_validation diagram|
[<databox>Train Data| data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<databox>Train Data] -:> [cross_validation| data: Train Data
seed: int
nfolds: int
groups: string
even_stratification: boolean | randomize()
stratify_data()
split_data()]
[cross_validation] -:> [<databox>Train Data Folds|  nfold: int
data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[cross_validation] -:> [<testbox>Valid Data Fold| nfold:int
data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[cross_validation] -:> [nfolds.txt]
]"


#RF train diagram
#RF train takes in training folds to produce RFs by different hyperparameters
RF_train_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#FFFF00
#.forestbox: #fill=#FF1111
[<frame> RF_train diagram|
[<databox>Train Data Folds| nfold: int
data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[model_select | hyperparameter: string | model_choice()]
[<databox>Train Data Folds] -:> [RF_train | data: Train Data Fold
formula: string
mtry: int
nodesize: int
tune.rfsrc()
model_select() | rfsrc()
rfsrc.fast()
sidClustering.rfsrc()
imbalanced.rfsrc()
quantreg.rfsrc()]
[model_select] -:> [RF_train]
[RF_train] -:> [<forestbox> random_forest | call: string
mtry: int
nodesize: int
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
forest: forest ]
]"

#RF test takes in testing folds to evaluate RFs by different hyperparameters
RF_test_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#FFFF00
#.forestbox: #fill=#FF1111
#.testbox: #fill=#00FFFF
#.optimalbox: #fill=#FF7777
[<frame> RF_test diagram|
[<forestbox> random_forest | call: string
mtry: int
nodesize: int
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
forest: forest ]
[<testbox>Valid Data Fold| nfold:int
data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<forestbox> random_forest] -:> [RF_test | object: random_forest
data: Valid Data Fold
proximity: boolean
hyperparameter: string
file.name: string
| predict.rfsrc()
write.tsv()
get_auc()]
[<testbox>Valid Data Fold] -:> [RF_test]
[RF_test] -:> [<optimalbox>optimal_RF_parameters | call: string
mtry: int
nodesize: int
err.rate: float
proximity: array]
]"

#RF model diagram
#RF model takes in the training data and trains an RF with the optimal RF hyperparameters
RF_model_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#FFFF00
#.proxbox: #fill=#FF007F
#.testbox: #fill=#00FFFF
#.optimalbox: #fill=#FF7777
#.forestbox: #fill=#FF1111
#.trainbox: #fill=#FFFF00
#.predictbox: #fill=#FF007F
[<frame> RF_model diagram|
[<optimalbox>optimal_RF_parameters | call: string
mtry: int
nodesize: int
err.rate: float
proximity: array]
[<trainbox>Train Data|  data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<optimalbox>optimal_RF_parameters] -:> [RF_optimal_train | data: Train Data
formula: string
file.path: string
file.name: string | read.tsv()
rfsrc()
rfsrc.fast()
sidClustering.rfsrc()
imbalanced.rfsrc()
quantreg.rfsrc()]
[<trainbox>Train Data] -:> [RF_optimal_train]
[RF_optimal_train] -:> [<forestbox> optimal_random_forest | call: string
mtry: int
nodesize: int
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
forest: forest ]
[<forestbox> optimal_random_forest] -:> [RF_optimal_test | data: Test Data Fold
proximity: boolean
hyperparameter: string
file.name: string |
predict.rfsrc()
get.auc()
write.tsv()]
[<testbox>Test Data| data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<testbox>Test Data] -:> [RF_optimal_test]
[RF_optimal_test] -:> [<predictbox> RF_prediction | proximity: array
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
err.rate: float]
]"

#Subtype ID diagram for RFRF
Subtype_ID_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.testbox: #fill=#00FFFF
#.subtype: #fill=#00FF00 visual=ellipse
#.predictbox: #fill=#FF007F
[<frame>Subtype_ID diagram|
[<predictbox>RF_prediction | proximity: array
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
err.rate: float ]
[<predictbox>RF_prediction] -:> [graph_from_adjacency_matrix |
proximity_matrix: proximity
mode: string
weighted: boolean
diag: boolean]
[graph_from_adjacency_matrix] proximity_graph -:> [cluster_infomap |
proximity_graph: graph]
[cluster_infomap] -:> [<subtype>subtypes]
]"

#interface diagram for RFRF
interface_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.optimalbox: #fill=#FF7777
#.fullbox: #fill=#F5F5DC visual=ellipse
#.inputbox: #fill=#F5F5DC
[<frame>interface diagram|[nfolds.txt | nfolds: list]
[nfolds.txt] -:> [interface_bash_wrapper | nfold: int
data: Train Data]
[<fullbox>Full Data] -:> [read_file| file_type: string
file_name: string
file_path: string | open()
close()]
[read_file] -:> [<inputbox>Input Data| data: data.frame
ID_column: string
outcome_column: string
nrows: int
ncols: int]
[<inputbox>Input Data] -:> [interface_bash_wrapper]
[interface_bash_wrapper] -:> [call_script.R | formula: string
mtry: int
nodesize: int
proximity: boolean
modularity: boolean |
tune.rfsrc()
RF_train()
RF_test()
]
[call_script.R] -:> [<optimalbox>optimal_RF_parameters | call: string
mtry: int
nodesize: int
err.rate: float
proximity: array
modularity: int]
]"

#diagram visualization (saving may not work properly within RStudio)
nomnoml(code = flow_diagram,png='flow_diagram.png')
nomnoml(code = holdout_diagram,png='holdout_diagram.png')
nomnoml(code = cross_validation_diagram,png='cross_validation_diagram.png')
nomnoml(code = RF_train_diagram,png='RF_train_diagram.png')
nomnoml(code = RF_test_diagram,png='RF_test_diagram.png')
nomnoml(code = RF_model_diagram,png='RF_model_diagram.png')
nomnoml(code = Subtype_ID_diagram,png='Subtype_ID_diagram.png')
nomnoml(code = interface_diagram,png='interface_diagram.png')



