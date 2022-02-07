install.packages("ggplot2")
library(ggplot2)

str(airquality) #속성
ggplot(airquality, aes(x=Day, y = Temp)) #x축은 Day열, y축은 Temp열로맵핑


#산점도/ 산포도 geom_polt()
#선 그래프 geom_line()
#박스플롯 geom_boxplot()
#히스토그램 geom_histogram()
#막대그래프 geom_bar()

#산점도 그리기
ggplot(airquality, aes(x = Day, y= Temp))+geom_point()

#산점도 그리기 (크기 3, 색상을 빨강, 삼각형)
ggplot(airquality, aes(x = Day, y= Temp))+
  geom_point(size =3, color = "red", pch=2)

ggplot(airquality, aes(x = Day, y= Temp))+
  geom_line(size = 0.5, color = "red")+
  geom_point(size=2,color="black")

ggplot(mtcars, aes(x=cyl))+geom_bar(width = 0.5) #width = 막대 두께
ggplot(mtcars, aes(x=factor(cyl))+ geom_bar(width = 0.5)

#누적 막대 그래프(cyl 종류별 빈도를 파악하되 그 안에서 cyl종류별 gear빈도까지 파악)
ggplot(mtcars, aes(x = factor(cyl)))+ geom_bar(aes(fill= factor(gear)))

#상자그림&히스토그램
ggplot(airquality, aes(x=Day, y=Temp, group=Day))+ geom_boxplot()#날짜별 온도 분포 확인

ggplot(airquality, aes(Temp))+geom_histogram()
ggplot(airquality, aes(Temp))+geom_histogram(binwidth = 1)

ggplot(economics, aes(x=date, y= psavert))+
  geom_line()+
  geom_abline(intercept = 12.18671, slope= -0.0005444)

#평행선,



