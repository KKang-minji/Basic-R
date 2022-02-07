
### code 6-7
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2







### code 6-8

##(1)Prepare Data
library(mlbench)
data("BostonHousing")

file.name <- choose.files()
BostonHousing

myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]

##(2)Add new column
grp <- c()
for(i in 1:nrow(myds)){
if(myds$medv[i]>=25.0){
  grp[i]<- "H"
} else if (myds$medv[i] <= 17.0){
  grp[i] <- "L"
} else {
  grp[i] <- "M"
}
}
grp <- factor(grp)
grp <- factor(grp, levels = c("H","M","L"))

myds <- data.frame(myds,grp)

##(3) Add new column
str(myds)
head(myds)
table(myds$grp)


#histogram
par(mfrow=c(2,3))
for(i in 1:5){
  hist(myds[,i], main = colnames(myds)[i],col="yellow")
}
par(mfrow=c(1,1))

#boxplot
par(mfrow=c(2,3))
for(i in 1:5){
  boxplot(myds[,i], main = colnames(myds)[i])
}
par(mfrow=c(1,1))

boxplot(myds$crim~myds$grp, main = "1인당 범죄율")









