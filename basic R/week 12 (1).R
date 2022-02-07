
#code 7-9
v1 <- c(1,7,6,8,4,2,3)
sort(v1,T)
idx <- order(v1,decreasing = T)
v1[idx]

v2 <- c(7,4,9)
idx <- c(1)
v2[idx]

data(iris)
head(iris)

#Sepal.Length 기준,오름차순
idx <- order(iris$Sepal.Length)
iris.order<- iris[idx, ]
head(iris.order)

#내림차순
idx <- order(iris$Sepal.Length,decreasing = T)
iris.order<- iris[idx, ]
head(iris.order)

#2차 정렬
idx <- order(iris$Sepal.Length, iris$Sepal.Width)
iris.order<- iris[idx, ]
head(iris.order)

#내림차순 2차 정렬
idx <- order(iris$Sepal.Length, iris$Sepal.Width, decreasing = T)
iris.order<- iris[idx, ]
head(iris.order)


#code 7-11
sp <- split(iris, iris$Species) 
# 품종별로 데이터 분리
sp
# 분리 결과 확인
summary(sp) 
# 분리 결과 요약(virginica만 뽑아냄)
sp$virginica


iris.sub <- subset(iris, Species=="setosa")
head(iris.sub)

summary(iris)

iris.sub <- subset(iris, Sepal.Length >5.8 & Sepal.Width>3,
                   select = c(Petal.Length, Petal.Width))
iris.sub


x <- 1:30

sample(x, 10, T)


x<- 1:150

set.seed(152) #항상 변함 없이 할때
idx <- sample(x,10)
idx

iris[idx, ]









