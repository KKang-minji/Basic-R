### 함수에 대한 도움말 -함수명을 알고 있는 경우
?sort

sort(x=d)
sort(d, decreasing = FALSE) #오름차순
sort(d, decreasing = TRUE) #내림차순순
sort(d, T)

###벡터에 논리연산자 적용
a<-3
b<-5

a>b
a<b
a==b
a!=b

#or
T | T
T | F
F | F
#and
T&T
T&F
F&T
F&F

d <- 1:9
d

tf <- d > 5 #tf에 저장
tf
d[tf] #d[]안에 논리연사값이 들어오면 트루값만 출력
      #d벡터에서 5보다 큰 값을 출력한 것
d[d>5]

d > 5
d < 8
tf <- d > 5 & d < 8
d[tf]

###문자형 벡터
str <- c('a','b','c','d','e','f','1')
str

### 규칙적인 문자열 생성
paste('a','b','c') #여러개의 문자를 합쳐주는 함수
paste('a','b','c', sep ='') #여백 지움

### 각 벡터의 길이가 1보다 큰 경우
paste('x',1:5)
paste('x',1:5, sep ='')



