
###########3. 단일 변수 연속형 자료의 탐색
######1. 평균과 중앙값
###code 5-5 
weight <- c(60,62,64,65,68,69)
weight.heavy <- c(weight, 120)
weight
weight.heavy

mean(weight)                 #평균
mean(weight.heavy)           #평균


median(weight)               #중앙값
median(weight.heavy)        #중앙값
 
mean(weight, trim=0.2)      #절사평균(상하위 20% 제외)
mean(weight.heavy,trim=0.2)  #절사평균 (상하위 20% 제외)

###########2. 사분위수
###code 5-6
mydata <- c(60,62,64,65,68,69,120)
quantile(mydata)
quantile(mydata, (0:10)/10)   #10% 단위로 구간을 나누어 계산
summary(mydata)


###5-7
mydata<- c(60,66,64,65,68,69,120)
var(mydata)
ssqrt(var((mydata)))
sd(mydata)
range(mydata) #최댓값과 최소값

#범위
diff(mydata)
diff(range(mydata))

##########4. 히스토그램
###code 5-8
data("cars")
dist<- cars$dist
dist<- cars[,2]
hist(dist,
     main= "Histogram for 제동거리",
     xlab = "제동거리",
     ylab = "빈도수",
     border = "blue",
     col = "green",
     las=2,
     breaks=5)

#######5. 상자그림
### code 5-9
dist <- cars$dist
b<- boxplot(dist)
b






