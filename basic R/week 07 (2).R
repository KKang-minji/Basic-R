#code 3-8
city<-c("seoul","tokyo","washington") #문자로 이루어진 벡터
rank<-c(1,3,2)  #숫자로 이루어진 벡터

city.info<- data.frame(city,rank)  #데이터프레임 생성
city.info   #city.info의 내용 출력

###iris 데이터셋-데이터 프레임
data(iris)
iris

class(iris)

# 매트릭스의 인덱싱 사용
iris[,c(1:2)]
iris[,c(1,3,5)]

cols<- c('Sepal.Length','Species')
iris[,cols]

iris[1:5,]

iris[1:5,c(1,3)]

# 리스트의 인덱싱 사용
iris$Species

head(iris,6) #맨위 부터 아래 6개
tail(iris,10) #맨밑부터 위 열개

########3.3 매트릭스와 데이터프레임 다루기
dim(iris)
nrow(iris)
ncol(iris)
colnames(iris) #컬럼의 이름 출력
head(iris)#앞에만 보고싶을때
tail(iris,6) #끝에 보고싶을때, head와 tail은 기본적으로 6


### iris 데이터셋의 추가적인 내용 확인하기
str(iris)
#'obs' 행의 개수 variables 열의 개수
#num: 숫자로 되어있다
#w/3: 3개의 레벨을 가지고 잇는 섹터다
#111111..: 레벨의 첫번째 값을 가지고 있다.

summary(iris)  #요약한 값을 볼 수 있음
#min: 최솟값 1st.Qu.: 

iris$species
iris[[5]]
iris[,5]
x<- iris[,5]
x
class(x)

unique(x) #중복된값을 제거, 고유한 값만 표현, 개수는 확인X

#빈도표, 교차표
table(x) #고유한 값의 개수를 확인 가능

### 매트릭스와 데이터프레임에서 사용하는 함수

dim(iris)

iris.sub<- iris[,1:4]
iris.sub<- iris[,-5]
head(iris.sub)

#열별합계
colSums(iris.sub)
col.mean<-colMeans(iris.sub) #평균
col.mean
 
#행별합계
rowSums(iris.sub)
#행별 평균
rowMeans(iris.sub)

###행과 열의 방향 전환

z<- matrix(1:20,4)
z

t(z)


###조건에 맞는 행과 열의 값 추출
IR.1<-subset(iris,Species=='setosa') #Species가'setosa'랑 같냐?
IR.1
 
IR.2<- subset(iris, Sepal.Length>5.0) #Sepal.Length이5.0보다 큰것만 뽑아냄

IR.2

IR.2<- subset(iris, Sepal.Length>5.0 & Sepal.Width>4.0)
IR.2

IR.2[,1:2] #매트릭스 인덱싱
IR.2[1:2]  #리스트 인덱싱

#행과 열 추출
IR.3<- subset(iris, Sepal.Length>5.0 & Sepal.Width>4.0 ,select=1:2)
IR.3

### 매트릭스와 데이터프레임에 산술연산
a<- matrix(1:20,4,5)
b<- matrix(21:40,4,5)
a
b

a*2
b-5
a*2 + b*3

a+b
b-a
b/a
a*b

##### 3.3.2 매트릭스와 데이터 프레임의 자료구조 확인
is.matrix(iris) #매트릭스냐
is.data.frame(iris) #데이터프레임이냐
class(iris) #넌 어떤형식이냐


##### 3.3.3 매트릭스와 데이터 프레임의 자료구조 변환
class(state.x77)           #class:matrix
st<- as.data.frame(state.x77)
class(st)                  #class: data.frame

class(iris)
iris.m<-as.matrix(iris[-5])  #as.matrix: data.frame을 matrix로 바꿀때
iris.m

#######3.3.4 데이터프레임의 열추출

col<- c(1,4,5)
col<- c('Sepal.Length','Petal.Width','Species')
#매트릭스 인덱스
iris[,cols]
#리스트 인덱스
iris[cols]
#subset()함수
#subset(데이터프레임, [행에 대한 조건, select=열 번호 또는 열 이름])
subset(iris, select=cols)

###################################################
#04 파일  데이터 읽기/쓰기
###################################################
data.file<-choose.files()
data.file

data<- read.csv(data.file)
data
dim(data)
head(data)

class(data)

x<- data$fight
table(x)

data.sub<- subset(data,fight==1)
dim(data.sub)


### 현재 작업 디렉토리
getwd() #내문서
write.csv(data.sub,"student_1.csv")




