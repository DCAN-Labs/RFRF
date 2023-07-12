#load libraries for diagram design
library(nomnoml)
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
[<testbox>Test Data] --:> [RF model]
[RF model] --:> [<proxmat>proximity matrix]
[<proxmat>proximity matrix] --:> [subtype identification]
[subtype identification] --:> [<subtype>subtypes]
]"
UML_diagram="blah"
nomnoml(code = flow_diagram,png='flow_diagram.png')
