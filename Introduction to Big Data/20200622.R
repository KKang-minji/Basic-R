
library(ggplot2)

#텍스트 입력 및 도형 그리기
 ggplot(airquality, aes(x=Day, y=Temp))+
   geom_point()+
   geom_text(aes(label=Temp, vjust=-0.2, hjust=-0.2))
 #세로 값과 가로값을 모두 0으로 입력하면 레이블은 각 점의 오른쪽 위, 
 #+값은 아래/왼쪽, -값은 위/ 오른쪽


ggplot(mtcars, aes(x= wt, y=mpg))+
  geom_point()+ #산점도 그리기
  annotate("rect", xmin=3,xmax=4,ymin=12,ymax=21,alpha=0.5,fill="skyblue")+
  #하늘색 투명한(alpha=0.5)사각형 모형 그리기
  annotate("segment", x=2.5,xend=3.7,y=10, yend=17,color="red",arrow= arrow())+
  #빨간색화살표 그리기
  annotate("text", x= 2.5, y=10, label="point")
# 레이블 추가


#그래프 제목 및 축 제목 추가
#막대 그래프에 제목추가
ggplot(mtcars, aes(x=gear))+ geom_bar()+
  labs(x= "기어수", y="자동차수", title= "변속기 기어별 자동차수")













