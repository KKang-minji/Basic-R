iris

class(iris$Species)

boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")

################한 화면에 그래프 여러개 출력하기
par(mfrow=c(1,3))
m<- matrix(1:3,1,3)
m<- matrix(1:4,2,2)
m<- matrix(c(1,3,2,3),2,2)
m
layout(m)

names(iris)

boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Width)

layout(1)   #풀림
##################06. 다중변수 자료의 탐색
#######산점도
head(iris)

x <- iris$ Sepal.Length
y <- iris$Sepal.Width
plot(x,y) 

### 두변수 사이의 산점도
### code 6-1
wt <- mtcars$wt                        #중량 자료
mpg <- mtcars$mpg                      #연비 자료
plot(wt, mpg,                          #2개 변수(x축,y축)
     main="중량-연비 그래프",          #제목
     xlab = "중량",                    #x축 레이블
     ylab = "연비(Mpg)",               #y축 레이블
     col = "red",                      #point의 color
     pch=19)                           #point의 종류


###
head(mtcars)

###code 6-2
vars <- c("mpg","disp","drat","wt")    #대상 변수
target <- mtcars[,vars]
target <- mtcars[vars]
head(target)
pairs(target,                          #대상 데이터 
      main= "Multi Plots")

class(target)
plot(target)


##########그룹 정보가 있는 두 변수의 산점도
head(iris)

plot(iris[-5])

iris.2 <-iris[1:4]
point<- as.numeric(iris$Species) #as.numeric= 숫자로 바꿔줌
color <- c("red","green","blue")[point]
color
plot(iris.2, pch=point, col=color)  #pch=point 종류마다 모양 다르게


#######R을 이용한 상관계수의 계산
x<- iris$Sepal.Length
y <- iris$Sepal.Width
cor(x,y)


x<- iris$Petal.Length
y <- iris$Petal.Width
cor(x,y)


###code 6-4
###음주정도와 혈중 알콜농도가 상관성 조사

beers = c(5,2,9,8,3,7,3,5,3,5)            #자료입력
bal <- c(0.1,0.03,0.19,0.12,0.04,      #자료입력
         0.0095,0.07,0.06,0.02,0.05)      
tbl <- data.frame(beers,bal)                #데이터 프레임 생성
tbl
plot(bal~beers,data=tbl, pch = 19)    #산점도

cor(beers,bal)            #상관계수 계산
res <- lm(bal~beers, data = tbl)         #회귀식 도출
summary(res)
abline(res,col="red")                           #회귀선 그리기
?abline #사전에 그림이 그려져잇을때 그위에 덧그려지는 것임


###code 6-5
cor(iris.2)


###code 6-6
month = 1:12                             #자료입력
late = c(5,8,7,9,4,6,12,13,8,6,6,4)      #자료입력
plot(month,                              #x data
     late,                               #y data
     main="지각생 통계",                 #제목
     type="l",                          #그래프의 종류 선택(알파벳)
     lty=1,                              #선의 종류(line type)선택
     lwd=1,                              # 선굵기 선택
     xlab="Month",                       #x축 레이블
     ylab="Late cnt"                    #y축 레이블
     )

plot(month, late, type="o", pch=19, lwd=3,lty=3) #o= overlab (점과 선 같이 씀)
# lwd=선의 굵기,pch=점모양, lty=선모양

month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4) 
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)

plot(month, late1, type="o", pch=19, lwd=3,lty=3)
lines(month, late2, type="o", pch=19, lwd=3,lty=3, col='red') 
#lines=plot위에 겹쳐서 그릴때












