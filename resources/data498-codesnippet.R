# decision tree template
library(caret)
library(rpart)
library(rpart.plot)

error_df <- data.frame(matrix(ncol = 2, nrow = 10))
colnames(error_df) <- c('dt_test_error', 'fold')

for(i in 1:nrow(error_df)){
  split_index <- createDataPartition(dataframe$response, p = 0.7, list = FALSE)
  training <- dataframe[split_index,]
  features_test <- dataframe[-split_index, !(colnames(dataframe) %in% c('response'))]
  target_test <- dataframe[-split_index, 'response']
  
  tree_model <- rpart(response ~ ., data = training)
  tree_pred <- predict(tree_model, newdata = features_test)
  tree_pred <- ifelse(tree_pred < 0.5, 1, 0)
  
  dt_error <- mean(ifelse(target_test != tree_pred, 1, 0))
  lr_error <- mean(ifelse(target_test != log_pred, 1, 0))
  error_df[i,'dt_test_error'] <- dt_error
  error_df[i, 'fold'] <- i
}