

library(h2o)

h2o.init()  ## start h2o
h2o.removeAll() ## clean state

data <- h2o.importFile(path = 'iris.data',
                       header = FALSE,
                       col.names = c('sepal-length',
                                     'sepal-width ',
                                     'petal-lengt',
                                     'petal-width',
                                     'class'))

y <- 'class'
x <- setdiff(names(data), y)
parts <- h2o.splitFrame(data, 0.8)
train <- parts[[1]]
test <- parts[[2]]

model <- h2o.randomForest(x, y, train, model_id = 'rf')
h2o.performance(model, test)


# Test Set Metrics: 
#   =====================
#   
#   MSE: (Extract with `h2o.mse`) 0.02084323
# RMSE: (Extract with `h2o.rmse`) 0.1443718
# Logloss: (Extract with `h2o.logloss`) 0.06661136
# Mean Per-Class Error: 0.04166667
# Confusion Matrix: Extract with `h2o.confusionMatrix(<model>, <data>)`)
# =========================================================================
#   Confusion Matrix: Row labels: Actual class; Column labels: Predicted class
# Iris-setosa Iris-versicolor Iris-virginica  Error     Rate
# Iris-setosa              10               0              0 0.0000 = 0 / 10
# Iris-versicolor           0              12              0 0.0000 = 0 / 12
# Iris-virginica            0               1              7 0.1250 =  1 / 8
# Totals                   10              13              7 0.0333 = 1 / 30
# 
# Hit Ratio Table: Extract with `h2o.hit_ratio_table(<model>, <data>)`
# =======================================================================
#   Top-3 Hit Ratios: 
#   k hit_ratio
# 1 1  0.966667
# 2 2  1.000000
# 3 3  1.000000









