#(1)
rm(excel_data)


data.file<- choose.files()
data.file

#install.packages("readxl")
library(readxl)

excel_data <- read_excel("C:\\Users\\user\\Desktop\\빅데이터개론\\대전광역시_역별_수송실적.xlsx")
View(excel_data)



#(2)
str(excel_data)

#(3)
dim(excel_data)

#(4)
library(dplyr)
ex1 <- rename(excel_data,year='연도', station_num='역번호', station='역명', Jan_1='1월승차', Jan_2='1월하차', Feb_1='2월승차', Feb_2='2월하차', Mar_1='3월승차', Mar_2='3월하차', Apr_1='4월승차', Apr_2='4월하차', May_1='5월승차', May_2='5월하차' )
View(ex1)

#(5)
ex1$Jan_diff <-ex1$Jan_1-ex1$Jan_2
ex1$Feb_diff <-ex1$Feb_1-ex1$Feb_2
ex1$Mar_diff <-ex1$Mar_1-ex1$Mar_2
ex1$Apr_diff <-ex1$Apr_1-ex1$Apr_2
ex1$May_diff <-ex1$May_1-ex1$May_2
View(ex1)

#(6)
Jan <- ex1%>% select(Jan_1)
Jan

max(Jan)

Jan_row<-filter(ex1, Jan_1==334026)
Jan_row
View(Jan_row)

#(7)
data1 <- ex1%>%select(Jan_diff)
data1

data2 <- ex1%>%select(Feb_diff)
data2

data3 <- ex1%>%select(Mar_diff)
data3

data4 <- ex1%>%select(Apr_diff)
data4

data5 <- ex1%>%select(May_diff)
data5

max(data1) 
min(data1)

max(data2)
min(data2)

max(data3)
min(data3)

max(data4)
min(data4)

max(data5)
min(data5)


d1<-filter(ex1, Jan_diff==19369,-21035)
d1
#차이보기쉬우려고 적어놓음
d2<-filter(ex1, Feb_diff==14768,-13291)
d2
d2
d3<-filter(ex1, Mar_diff==9047,-9130)
d3
d4<-filter(ex1, Apr_diff==10325,-12230)
d4
d5<-filter(ex1, May_diff==12676,-17209)
d5

#답:반석, 21035차이남


#(8)
library(reshape2)
ex1_melt <- melt(data = ex1, id.vars = c("year", "station"), 
                 measure.vars = c("Jan_1", "Mar_1"))

ex1_melt


#(9)
ex_dcast<- dcast(ex1_melt,year+station~variable)
ex_dcast


#(10)
#1
ex1$JMdiff <- ex1$Jan_1-ex1$Mar_1
ex1$JMdiff

#2
#1월에는 명절때문에 많은 대전에 거주하는 사람들이 고향에 내려가기 위해 승차인원이 많지만 3월에는 그에 반해 적기때문에 차이가 많이난다
#3
max(ex1$JMdiff)
area_JM<-filter(ex1, JMdiff==188903)
area_JM
#답:대전역


#(11)

ex1$JMdiff_1<- ifelse(ex1$JMdiff>=150000, "A",
                     ifelse(ex1$JMdiff>=100000,"B",
                            ifelse(ex1$JMdiff>=50000,"C",
                                   "D")))

ex1$JMdiff_1

#1,3월승차인원차이와 차이에 따른값 합침
ifJM<-cbind(ex1$JMdiff,ex1$JMdiff_1)
ifJM
View(ifJM)


#(12)
library(ggplot2)

Jan1<-ex1$Jan_1
Jan1

ggplot(ex1, aes(x= station, y=Jan_1))+
  geom_point(size=1)+
  labs(title = "1월 정류장별 승차인원", x = "지하철역", y = "승차인원(명)")+
  geom_text(aes(label = Jan1),size=2,vjust =-0.5,hjust=-0.5)+theme(plot.title = element_text(hjust = 0.5))



#(13)

boxplot(ex1$Jan_1,ex1$Mar_1, main="지하철 승차인원 분포차이",xlab="Jan.vs.Mar", 
        names=c("January","March") , ylab="승차인원(명)",col="gray")




