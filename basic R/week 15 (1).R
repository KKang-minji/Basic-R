
library("ggmap")

#경도와 위도로 표시할 사각형의 좌하, 우상의 좌표
boxLocation <- c(127.25305,36.23972, 127.51639,36.47306)

#stamen에서 maptype="terrain"으로 지도 다운로드
krMap<- get_map(location = boxLocation,source = "stamen",
                maptype = "terrain")

#지도 표시
ggmap(krMap)

file.path<- choose.files()
file.path

data<- read.csv(file.path, header = T)
dim(data)  #자료 몇개있는지
head(data)
names(data)

table(data$상권업종대분류명)

df <- subset(data, 상권업종대분류명=="음식")
df <- subset(data, 상권업종소분류명=="커피전문점/카페/다방")
dim(df)


ggmap(krMap)+
  geom_point(data = df, aes(x=경도, y=위도, color=상권업종소분류명), size=2)


library(leaflet)
library(dplyr)


leaflet()%>%
addTiles()%>%
setView(lng = 127.381653, lat = 36.3523647,zoom=12)%>%
addMarkers(data=df, lng=~경도, lat=~위도, popup=~상호명)







