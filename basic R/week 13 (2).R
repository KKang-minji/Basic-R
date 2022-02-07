
#8-11
library(ggplot2)
ggplot(data=iris, aes(y=Petal.Length)) +
  geom_boxplot(fill="yellow")

#8-12
ggplot(data=iris, aes(y=Petal.Length, fill=Species)) +
  geom_boxplot()


#8-13
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)               # 데이터 준비
head(df)
ggplot(data=df, aes(x=year,y=cnt)) +     # 선그래프 작성
  geom_line(col="red")


##########지도
#install.packages("ggmap")

library("ggmap")

#경도와 위도로 표시할 사각형의 좌하, 우상의 좌표
boxLocation <- c(127.25305,36.23972,127.51639,36.47306) 



#stamen에서 maptype="terrain"으로 지도 다운로드
KrMap<-  get_map(location = boxLocation,source = "stamen", maptype = "terrain")

#지도 표시
ggmap(KrMap)

file.path<- choose.files()
file.path

df <- read.csv(file.path, header = T)
summary(df)

df <- na.omit(df)

ggmap(KrMap)+
  geom_point(data=df, aes(x=X좌표,y=Y좌표, color=종별코드명), size=2)


ggmap(KrMap)+
  geom_point(data=df, aes(x=X좌표,y=Y좌표, color=종별코드명, size=전체병상수))

#install.packages("leaflet")
#install.packages("dplyr")

library(leaflet)
library(dplyr)

leaflet() %>%
   addTiles() %>%
   setView(lng= 127.381653, lat= 36.3523647,zoom=12) %>%
   addMarkers(data=df, lng=~X좌표, lat=~Y좌표, popup=~요양기관명)



