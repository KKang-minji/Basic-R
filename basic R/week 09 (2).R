
############### code 4-15

apply(iris[,1:4],1,mean) #row()방향으로 함수 적용
apply(iris[,1:4],2,mean)# col() 방향으로 함수 적용

head(iris)
iris.sub<- iris[,1:4]
iris.sub<- iris[1:4]

apply(iris.sub,1, mean)
apply(iris.sub,2, mean)

apply(iris.sub,2,max)

#4-16

mymax<- function(x,y){
  num.max <- x
  if(y>x){
    num.max <- y
  }
  return(num.max)
}

#4-17
a<- mymax(10,15)
b<- mymax(31,45)
a+b

#####사용자 정의함수의 매개변수에 초기값 설정하기
###code 4-18
mydiv <- function(x,y=2) {
  result <- x/y
  return(result)
}

mydiv(x=10, y=3) #내가 적용한 값이 적용되어 함수 실행
mydiv(10,3) #위와 동일
mydiv(10) #x는 10이라는 값을 받앗는데 y는 못받아서 오류가 나는게 아니라 함수에 지정해놓은 y값이 그대로 들어감


#tip
#return함수 쓰지않아도 연산이 간단하거나 맨마지막에 변수값 하나를 사용하면 똑같이 나옴
#1)
mydiv <- function(x,y=2) {
  x/y
}
mydiv(x=10, y=3)

#2)
mydiv <- function(x,y=2) {
 z<- x/y
 z
}
mydiv(x=10, y=3)


#####함수가 반환하는 결과값이 여러 개일 때의 처리
###code 4-19
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum=val.sum, mul=val.mul))   #값이 여러개 있을때 List ,list는 각자의 값을 내보낼 수 있음
  
}
#######사용자 정의 함수의 저장 및 호출
###code 4-20
result <- myfunc(5,8)
class(result)
names(result)  #어떤 이름을 가지고 있는가

result$sum #5와 8더한 값
result$mul #5와 8 곱한값



###사용자 정의 함수의 저장 및 호출
#code 4-20
rm(list=ls()) #변수 지워줌
source("")  #다른곳에 만들어놓은 파일을 불러옴

###code 4-21
score <- c(76,84,69,50,95,60,82,71,88,84)
which(score==69)   #성적이 69인 학생은 몇 번째에 있나
which(score>=85)   #성적이 85 이상인 학생은 몇번째에 있나
max(score)         #최고 점수는 몇점인가
which.max(score)   #최고 점수는 몇번째에 있나
min(score)         #최저점수는 몇점인가 
which.min(score)   #최저점수는 몇번째에 있나

#85이상 95이하
which(score>=85&score<=95)

###code 4-22
idx<- which(score<=60)
score[idx]<- 61
score

idx <- which (score >= 80)
score[idx]

score[score >= 80]

###code 4-23
idx<- which(iris$Petal.Length>5.0)
iris[idx,]

subset(iris,iris$Petal.Length>5.0) #iris에서 Petal.Length>5.0에 해당하는 필요한것을 뽑아온다.
subset(iris,Petal.Length>5.0 ) 

###code 4-24
idx <- which(iris[,1:4]>5.0, arr.ind=TRUE) #몇번째 행 몇번째 열에 잇는값이 5.0보다 큰가 배열
idx









###code 5-1
favorite <- c('WINTER','SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL','SUMMER','SPRING','SPRING')
favorite
table(favorite)
table(favorite)/length(favorite)*100


#####막대그래프의 작성
###code 5-2
ds<-table(favorite)
ds

barplot(ds)

#####원그래프의 작성- 비율
### code 5-3
pie(ds, main = "원그래프")












