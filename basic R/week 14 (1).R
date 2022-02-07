file.1<- choose.files()
file.1

data.1 <- read.csv(file.1, header = T)
head(data.1)
tail(data.1)

class(data.1)

summary(data.1) #각 변수별로 요약

x<- 1:8739
y<- data.1$수위
plot(x,y, type="l")
 


file.2<- choose.files()
file.2 # "C:\\Users\\user\\Desktop\\베이직R\\1944_대전태평(암반)_(2018)_관측자료_시.csv"

data.2 <- read.csv(file.2, header = T)
head(data.2)
tail(data.2)

class(data.2)

summary(data.2) #각 변수별로 요약

dim(data.2)

x<- 1:8752
y<- data.2$수위
plot(x,y, type="l")


data.2


###자료병합(merge)
#둘이 같을때
data <- merge(data.1, data.2, by=c("날짜", "시간"))
#각 자 다를때
data <- merge(data.1, data.2, by.x=c("날짜", "시간"), by.y=c("날짜", "시간"))


dim(data) #행과 열의 개수를 알려줌
head(data) #첫번째(dataa.1) 잇었던 애는 .x를 넣고 두번째(data.2)에 있던 애는 .y라고 나옴

x<- 1:8732
y<- data$수위.x
plot(x,y, type="l", ylim = c(0,50), col="red")

y<- data$수위.y
lines(x,y, col="blue")



#############################
library(ggplot2)

ggplot(data, aes(1:8732, 수위.y)) +
  geom_line()

ggplot(data)+
  geom_line(aes(1:8732, 수위.x), color="red")+
  geom_line(aes(1:8732, 수위.y), color="blue")









