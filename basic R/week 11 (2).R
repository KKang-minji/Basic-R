
z<- c(1,2,3,NA,5,NA,8)   #결측값(NA)이 포함된 벡터 z
sum(z)

is.na(z)                    #z에 NA가 있냐
sum(is.na(z))               #T=1, F=0의 합
sum(z, na.rm=TRUE)


z1<- c(1,2,3,NA,5,NA,8)   #결측값이 포함된 벡터 z1
idx <- is.na(z1)
z1[idx] <- 0
z1[is.na(z1)] <-0
z1           #NA가 잇던 자리에 0이 들어가 있음



z2 <- c(5,8,1,NA,3,NA,7)
z3 <- z2[!is.na(z2)] #!=결측값(NA)만 빼고 나옴

z3

### code 7-3
#NA를 포함하는 test 데이터 생성
x <- iris
x[1,2] <- NA;x[1,3]<- NA
x[2,3] <- NA; x[3,4]<- NA
head(x)

### 데이터 프레임의 열별 결측값 확인
head(is.na(x))

colSums(is.na(x)) #열별(컬럼별)로 더한값

###데이터 프레임의 행별 결측값 확인
rowSums(is.na(x))

###데이터 프레임의 전체 결측값 확인
sum(is.na(x))


###결측값을 제외하고 새로운 데이터셋 만들기
#결측값이 하나라도 있는 행 자체를 없앰
y <- na.omit(x)
head(y)


##code 7-7
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

boxplot.stats(st$Income)


###code 7-8
out.val <- boxplot.stats(st$Income)$out 
# 특이값 추출
st$Income %in% out.val
st$Income[st$Income %in% out.val] <- NA  #NA 탐지
st$Income

st.comp <- na.omit(st)                   #NA 포함된것을 지움
st.comp$Income                           #NA 포함된걸 지운 값
# 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),] 
# NA가포함된행제거
head(newdata)


#(ex) %in% = 포함이 되어있나 없나 알 수 있는 연산자 (숫자, 문자 가능)
x <-  1:10
y <- 4
x  %in% y
# 4라는 값이 있으면 T, 없으며 F












