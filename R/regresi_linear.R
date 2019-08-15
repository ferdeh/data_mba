data<- read.csv("https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/house_price_clean.csv")
head(data)
summary(data)
#menghilangkan NA
train <- data[!is.na(data$SalePrice),]
#cek ulang mean 
summary(train)
linearMod <-lm(SalePrice ~ TotalSqFeet + TotBathroom + OverallQual + GarageCars + Age, data=train)
summary(linearMod)

library(corrplot)
M<-cor(data)
corrplot(M, method="circle")