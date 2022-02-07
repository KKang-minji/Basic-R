##### 팩터(factor)
#정의: 원소값을  그룹화하도록 설계된 범주형(이산형)자료의 벡터
#문자형 자료와 (그룹화된) 수치형 자료를모두 가지고 있음
#-출력은 문자형이지만, 유형(mode)는 수치형임
str <- c('A','B','B','O','AB','A')
str
### factor로 변환
fac <- factor(str)
fac

###mode 확인
mode(str) #문자형
mode(fac) #숫자형

as.numeric(fac)

##### 매트릭스 (matrix: 행렬)
z <- 1:20
matrix(z,4,5) #행,렬 #열부터 채움
matrix(z,4,5, byrow=T)  #행부터 채움

### 행렬연산
a <- c(5,8,6,10)
A <- matrix(a,2)#행과 열의 수가 같다면 행만써도 됨
A
b<- c(2,3,5,6)
B <- matrix(b,2)
B

#덧셈
A+B
A-B
A*B
A/B

#행렬곱
A%*%B

#전치
t(A)

#행렬식
det(A) #|A|=2

#역행렬
solve(A)

A%*%solve(A)

#code 3-3
x <- 1:4
y <- 5:8
z <- matrix(1:20,4)
x
y
z

m1<- cbind(x,y) #x옆에 y붙임(열로 붙여라)
m1

m2<-rbind(x,y) #행으로 붙여라
m2

m3<-rbind(m2,x)
m3

m4<-cbind(z,x)
m4


###매트릭스에서 값 추출
z 

z[2,3]#행,렬
z[1,4]
z[2, ]
z[,5]
z

### 매트릭스에서 여러개의 값을 동시에 추출하기
z[1,1:3]
z[1,c(1,2,4)]
z[1,c(1,2,4)]

s <- c(90,85,69,78,85,96,49,95,90,80,70,60)
score <-matrix(s,4,3)
score

colnames(score) <- c('E', 'M', 's')
score

rownames(score) <- c('a','b','c','d')
score

colnames(score)[3] <- "K"
score

###
score[2,2]
score[2, ]
score['b','M']
score['b',c('E','K')]

#103까지 내용












