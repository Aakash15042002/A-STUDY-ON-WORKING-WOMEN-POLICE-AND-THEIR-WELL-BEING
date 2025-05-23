library(e1071)
data=read.csv("Akdata.csv")
data
train_index <- sample(1:nrow(data), 0.94 * nrow(data))
train_data <- data[train_index, ]
train_data
test_data <- data[-train_index, ]
test_data
nb_model <- naiveBayes(JI~ ., data = train_data)
predictions <- predict(nb_model, test_data)
confusion_matrix <- table(predictions, test_data$JI)
print(confusion_matrix)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", accuracy))

