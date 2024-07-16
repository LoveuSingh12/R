library(dplyr)
library(caret)
library(randomForest)
library(pROC)
library(rpart)

creditcard_data <- read.csv(file.choose())

creditcard_data$Amount <- scale(creditcard_data$Amount) 

set.seed(123)
trainIndex <- createDataPartition(creditcard_data$Class, p = 0.7, 
                                  list = FALSE)
trainData <- creditcard_data[trainIndex, ]
testData <- creditcard_data[-trainIndex, ]

# Logistic Regression
log_model <- glm(Class ~ ., data = trainData, family = binomial)
log_pred <- predict(log_model, newdata = testData, type = "response")
log_pred_class <- ifelse(log_pred > 0.5, 1, 0)

# Decision Tree
tree_model <- rpart(Class ~ ., data = trainData, method = "class")
tree_pred <- predict(tree_model, newdata = testData, type = "class")

confusion_matrix_log <- confusionMatrix(as.factor(log_pred_class),
                                        as.factor(testData$Class))
confusion_matrix_tree <- confusionMatrix(as.factor(tree_pred),
                                         as.factor(testData$Class))

print(confusion_matrix_log)
print(confusion_matrix_tree)

# ROC curve for logistic regression
roc_log <- roc(testData$Class, as.numeric(log_pred))
plot(roc_log, main = "ROC Curve (Logistic Regression)")

# ROC curve for decision tree
roc_tree <- roc(testData$Class, as.numeric(tree_pred))
plot(roc_tree, main = "ROC Curve (Decision Tree)")

saveRDS(tree_model, file = "final_tree_model.rds")
saveRDS(log_model, file = "final_log_model.rds")