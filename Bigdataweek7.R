#project using neuralnet 
install.packages("neuralnet")
library(neuralnet)
set.seed(1234)

Var1 <- runif(50, 0, 100)

sqrt.data <- data.frame(Var1, Sqrt=sqrt(Var1))
print(net.sqrt <- neuralnet(Sqrt~Var1, sqrt.data, hidden=10,
                            threshold=0.01))
predict(net.sqrt, data.frame(Var1 = (1:10)^2))
net.results <- compute(net.sqrt, var1)
cleanoutput <- cbind(var1,sqrt(var1),
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- c("x","y","prediction")
print(cleanoutput)

net.results <- compute(net.sqrt, testdata)

cleanoutput<- cbind()

training <- data.frame(x= runif(50, min=0, max=100))
training$y <- sqrt(training$x)
#testdata <- as.data.frame((1:10)^2)
#net.results <- compute(net.sqrt, testdata) 
testing <- data.frame(x = (1:10)^2)

testing$y <- sqrt(testing$x)

model = neuralnet(y~x,training, hidden=10,
                  threshold=0.01)

testing$prediction = predict(model, newdata = testing)
testing
set.seed(1234)

training <- data.frame(x = runif(50, min=0, max=100))
training$y <- sqrt(training$x)


testing <- data.frame(x = (1:10)^2)
model = neuralnet(y~x,training)
testing$prediction = predict(model, newdata = testing)
testing


