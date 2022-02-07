rm(list=ls())
library(readxl)
exdata1<- read_excel("c:/Users/user/Desktop/Sample1.xlsx")
exdata1
library(dplyr)

exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT = AMT16)


select(exdata1, ID)
exdata1%>%select(ID)
#체인함수 (단축키 ctrl+shift+m)data를 계속 입력안해도 연산되는 편리함
 #연결하여 연산하는 기능을 가지고있습니다.

select(exdata1, ID, AREA, Y17_CNT)
exdata1 %>% select(ID, AREA,Y17_CNT)

exdata1 %>% filter(AREA=='서울')
exdata1 %>% filter(AREA =='서울'&Y17_CNT>=10)
View(exdata1)

exdata1 %>% arrange(AGE)
exdata1 %>% arrange(desc(Y17_AMT))




