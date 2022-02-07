
##code 4-1
job.type<- 'A'
bonus<- 200 
if(job.type=='B') {   
                #직무유형이 B일 때 실행
} else {
   bonus<-100             #직무 유형이 B가 아닌 나머지 경우 실행
   
}
print(bonus)

######else가 생략된 if문
##code 4-2
job.type<- 'B'

bonus<-100  
if(job.type=='B') {   
  bonus<-200             #직무 유형이 B가 아닌 나머지 경우 실행
}
print(bonus)

#########다중 if-else문
###code 4-3
score <- 85

if(score>90){
  grade <-'A'
}else if (score > 80){
  grade <-'B'
}else if (score > 70){
  grade <- 'C'
}else if (score > 60){
  grade <-'D'
}else {
  grade <-'F'
}

print(grade)


#######조건문에서 논리 연산자의 사용
### code 4-4
a<- 10
b<- 20
if(a>5 & b>5) {           #and 사용
  print (a+b)
}
if(a>5 | b> 30) {        #or 사용
  print (a*b)
}
 
###code 4-5
a<-10
b<-20

if (a>b){
  c<-a
}else {
  c<-b
}
print(c)

#if else()
a<- 10
b<-20

c<- ifelse(a>b,a,b)
print(c)

###
a<-92

if(a>90){
  b<-'A'
} else {
  b<-'B'
}
b

a <- c(92,85)
b<- ifelse(a>90,"A","B")
b

###예
x <- c(1,2,3,4,5,6) # 축약 1:6
y <- ifelse(x %% 2 == 0, 'F', 'M')
y




##########02반복문
######기본 for문
###code 4-7
for(i in 1:5){
  print('*')
}

###code 4-8
for(i in 6:10) {
  print(i)
}

i

#######반복 범위에 따른 반복 변수의 값 변화
###code 4-7

for (i in 1:9) {
  cat('2*',i,'=','\n') #cat=출력
}

#########반복 변수를 이용한 구구단 출력
###4-8
x<- 8
for (i in 1:9) {
  cat('2*',i,'=',2*i,'\n') #cat=출력
}


######for문 안에서 if문의 사용
###code 4-9
for (i in 1:20) {    #짝수인지 확인
  if(i%%2==0){
    print(i)
  }
}

########1~100 사이의 숫자의 합 출력
#code 4-10
sum<-0
for(i in 1:100){
  sum <- sum+i     # sum에 i 값 누적
}
print(sum)


#code 4-11
norow <- nrow(iris)                   #iris의 행의 수
mylabel<-c()                          #비어잇는 벡터 선언
for (i in 1:norow) {
  if (iris$Petal.Length[i]<= 1.6){  #꽃잎의 길이에 따라 레이블 결정
    mylabel[i]<- 'L'
  }else if (iris$Petal.Length[i]>=5.1){
    mylabel[i]<-'H'          #5.1보다 크면 H
    }else{
  mylabel[i]<-'M'   #그중간에 잇으면 M
  }
}
print(mylabel)                  #레이블 출력
newds<- data.frame(iris$Petal.Length, mylabel) #꽃잎의 길이와 레이블 결합
head(newds)                     #새로운 데이터셋 내용 출력

mylabel[52]



