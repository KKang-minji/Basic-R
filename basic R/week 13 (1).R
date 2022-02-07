#install.packages("ggplot2")

library("ggplot2")

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)            # 그래프를 작성할 대상 데이터
df

barplot(rain~month, data = df, col="skyblue")

ggplot(data=df, aes(x=month,y=rain)) +   # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",              # 막대의 높이는 y축에 해당하는 열의 값
           width=0.7,                    # 막대의폭지정
           fill="steelblue")             # 막대 색깔


##제목 표현
barplot(rain~month, data = df, col="skyblue", main="월별 강수량량")


###8-6
ggplot(data=df, aes(x=month,y=rain)) +   # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",              # 막대의 높이는 y축에 해당하는 열의 값
           width=0.7,                    # 막대의폭지정
           fill="steelblue")  +
  ggtitle("월별 강수량") + 
  theme(plot.title = element_text(size = 25, face = "bold",colour = "steelblue"))+
  coord_flip()#x,y축 바꿈


ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)


###8-8
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position="dodge") +
  ggtitle("월별 강수량")+
  theme(legend.position="bottom")

###8-9
#산점도
                
ggp<- ggplot(data= iris,aes(x=Petal.Length, y= Petal.Width, color= Species))+
  geom_point(size=3)+
  ggtitle("꽃잎의 길이와 폭")+
  theme(plot.title = element_text(size = 25, face="bold", colour = "steelblue"))+
  theme(legend.position = "bottom")

ggp


ggplot(data=iris, aes(x= Petal.Length, y=Petal.Width, color=Species))+
  geom_point(size=3)+
  ggtitle("꽃잎의 길이와 폭")

