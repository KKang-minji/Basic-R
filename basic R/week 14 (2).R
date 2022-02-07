data.file<- choose.files()
data.file

data <- read.csv(data.file, header = T)
head(data)
tail(data)

class(data)

summary(data) 

boxplot(data$사고건수)

###subset

#행선택(필터)
data.sub <- subset(data, 도로종류=="고속국도")
data.sub
#열선택
cols <- c("시간대","사고건수","사망자수")
data.use <- data.sub[cols]
data.use

barplot(사고건수~시간대, data=data.sub)

#고속국도
# bar 그래프의 형태에 대해 지정해줍니다. identity는 y축 값의 높이를 데이터를 기반으로 정해줄 때 사용
ggplot(data.sub, aes(시간대, 사고건수)) + 
  geom_bar(stat = "identity")+                  #stat='identity'는 y축의 높이를 데이터의 값으로 하는 bar그래프의 형태
  coord_flip()


#전체
ggplot(data, aes(시간대, 사고건수)) + 
  geom_bar(stat = "identity")+
  coord_flip()


ggplot(data, aes(시간대, 사고건수, fill=도로종류)) + 
  geom_bar(stat = "identity")+
  coord_flip()

ggplot(data, aes(시간대, 사고건수, fill=도로종류)) + 
  geom_bar(stat = "identity", position='fill')+
  coord_flip()



###산점도
plot(data$사고건수,data$부상자수)

#산점도행렬

data[,3:8]
data[3:8]
data[c(-1,-2)]
plot(data[3:8])

ggplot(data, aes(사고건수, 부상자수, color=도로종류))+
  geom_point(size=3)




