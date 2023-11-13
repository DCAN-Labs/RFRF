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
#.trainbox: #fill=#FFFF00
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
[Create Data Holdout] -:> [<trainbox>Train Data|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[Create Data Holdout] -:> [<databox>Test Data|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
]"

#cross-validation diagram -- cross validation tak
#cross validation takes in a training dataset and produces stratified fold to send through RF_train and RF_test
CV_UML_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.databox: #fill=#FFFF00
#.testbox: #fill=#00FFFF
[<frame> Cross-Validation UML Diagram|
[<databox>Train Data| data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<databox>Train Data] -:> [Cross Validation Folds| nfolds: int
stratify by: string
even stratification: boolean | split_data()
stratify_data()
randomize()]
[Cross Validation Folds] -:> [<databox>Output Folds|  nfolds: int
data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
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
[<frame> RF Train Diagram|
[<databox>Train Folds| ntrain_folds: int
data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[Model Select | hyperparameter: string | model_choice()]
[<databox>Train Folds] -:> [RF Train | ntrain_folds: int
data: data.frame
formula: string
mtry: int
nodesize: int | rfsrc()
rfsrc.fast()
sidClustering.rfsrc()
imbalanced.rfsrc()
quantreg.rfsrc()]
[Model Select] -:> [RF Train]
[RF Train] -:> [<forestbox> Random Forest | call: string
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
[<frame> RF Test Diagram|
[<forestbox> Random Forest | call: string
mtry: int
nodesize: int
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
forest: forest ]
[<testbox>Test Fold|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<forestbox> Random Forest] -:> [RF Test | hyperparameter: string
file.name: string
| predict.rfsrc()
write.tsv()
get.auc()]
[<testbox>Test Fold] -:> [RF Test]
[RF Test] -:> [<optimalbox>Optimal RF Parameters | call: string
mtry: int
nodesize: int
err.rate: float]
]"

#RF model diagram
#RF model takes in the training data and trains an RF using the
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
[<frame> RF Model Diagram|
[<optimalbox>Optimal RF Parameters | call: string
mtry: int
nodesize: int
err.rate: float]
[<trainbox>Train Data|  data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<optimalbox>Optimal RF Parameters] -:> [RF Optimal Train | data: data.frame
formula: string
file.path: string
file.name: string | read.tsv()
rfsrc()
rfsrc.fast()
sidClustering.rfsrc()
imbalanced.rfsrc()
quantreg.rfsrc()]
[<trainbox>Train Data] -:> [RF Optimal Train]
[RF Optimal Train] -:> [<forestbox> Optimal Random Forest | call: string
mtry: int
nodesize: int
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
forest: forest ]
[<forestbox> Optimal Random Forest] -:> [RF Optimal Test | hyperparameter: string
file.name: string |
predict.rfsrc()
create.matrix()]
[<testbox>Test Data| data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<testbox>Test Data] -:> [RF Optimal Test]
[RF Optimal Test] -:> [<predictbox> RF Prediction | proximity: array
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
err.rate: float |
get.auc()]
]"

#subtype ID diagram for RFRF
subtype_ID_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.testbox: #fill=#00FFFF
[<frame>Subtype ID Diagram|
[RF Prediction | proximity: array
yvar: data.frame
yvar.names: string
xvar: data.frame
xvar.names: string
err.rate: float |
get.auc()]
[RF Prediction] -:> [matrix to graph |
adjmatrix: array
mode: undirected
weighted: TRUE
diag: FALSE |
graph_from_adjacency_matrix()]
[<testbox>Test Data| data: data.frame
ID column: string
Outcome Column: string
nrows: int
ncols: int]
[<testbox>Test Data] -:> [matrix to graph]
[matrix to graph] -:> [proximity graph |
proximity_graph: graph]
[proximity graph] -:> [community detection function |
cluster_infomap()]
]"

#interface diagram for RFRF
interface_diagram="#stroke: #000000
#direction: down
#padding: 4
#spacing: 20
#fontsize: 10
#gutter: 20
#.testbox: #fill=#00FFFF
[<frame>Interface Diagram|

[<testbox> TEST]
]"

#diagram visualization (saving may not work properly within RStudio)
nomnoml(code = flow_diagram,png='flow_diagram.png')
nomnoml(code = Holdout_UML_diagram,png='holdout_UML_diagram.png')
nomnoml(code = CV_UML_diagram,png='CV_UML_diagram.png')
nomnoml(code = RF_train_diagram,png='RF_train_diagram.png')
nomnoml(code = RF_test_diagram,png='RF_test_diagram.png')
nomnoml(code = RF_model_diagram,png='RF_model_diagram.png')
nomnoml(code = subtype_ID_diagram,png='subtype_ID_diagram.png')


