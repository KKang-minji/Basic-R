ID<-c(1:5)
ID

SEX <-c("F","M","F","M","F")
SEX

data <- data.frame(ID=ID, SEX=SEX)
View(data)
install.packages("readxl")
library(readxl)
excel_data_ex<-read_excel("C:/Users/user/Desktop/bigdata/data_ex.xls")
excel_data_ex
ex_data<-read.table("C:/Users/user/Desktop/bigdata/data_ex.txt")
ex_data
varname<-c("ID","SEX","AGE","AREA")
ex_data1<-read.table("C:/Users/user/Desktop/bigdata/data_ex1.txt")
ex_data2<-read.table("C:/Users/user/Desktop/bigdata/data_ex2.txt",sep=",",col.names = varname)
View(ex_data2)


ID<-c(1:5)
SEX<-c("F","M","F","M","F")
data_ex_rda<-data.frame(ID=ID, SEX=SEX)

save(data_ex_rda, file = "data_ex_rda.rda")
load("C:/Users/user/Desktop/bigdata/data_ex_rda.rda")
View(data_ex_rda)

data_ex_csv<-data.frame(ID=ID, SEX=SEX)
write.csv(data_ex_csv, file = "data_ex_csv.csv")

rm(list=ls())
library(readxl)
exdata1 <- read_excel("c:/Users/user/Desktop/bigdata/Sample1.xlsx")
exdata1
library(dplyr)
exdata1 <- rename(exdata1, Y17_AMT=AMT17, Y16_AMT=AMT16)
exdata1 %>% select(ID)
select(exdata1, ID, AREA, Y17_CNT)
exdata1%>%select(ID, AREA, Y17_CNT)

exdata1%>%filter(AREA=='서울')
exdata1%>%filter(AREA=='서울'& Y17_CNT)

exdata1%>%arrange(AGE)
exdata1%>%arrange(desc(Y17_AMT))

exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))
exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = mean(Y17_AMT))

ex_group <- group_by(exdata1,AREA)
summarise(ex_group, sum_Y17_AMT = sum(Y17_AMT))

library(readxl)
m_history <- read_excel("c:/Users/user/Desktop/bigdata/Sample2_m_history.xlsx")
f_history <- read_excel("c:/Users/user/Desktop/bigdata/Sample3_f_history.xlsx")

View(m_history)
View(f_history)

exdata_binjoin <- bind_rows(m_history, f_history)
exdata_binjoin



library(readxl)
jeju_y17_history <- read_excel("c:/Users/user/Desktop/bigdata/Sample4_y17_history.xlsx")
jeju_y16_history <- read_excel("c:/Users/user/Desktop/bigdata/Sample5_y16_history.xlsx")

View(jeju_y17_history)
View(jeju_y16_history)

pind_col <- left_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(pind_col)

pind_col_inner <- inner_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(pind_col_inner)

pind_col_full <- full_join(jeju_y17_history, jeju_y16_history, by = "ID")
View(pind_col_full)


rm(list = ls())
library(readxl)
exdata1 <- read_excel("c:/Users/user/Desktop/bigdata/Sample1.xlsx")
exdata1

install.packages("descr") # freq함수를 포함
library(descr)

freq_test <- freq(exdata1$AREA, plot = F)
freq_test <- freq(exdata1$AREA)
freq_test

