ID <- c(1:5)
ID

SEX<- c("F","M","F","M","F")
SEX

DATA <- data.frame(ID=ID,SEX=SEX)
DATA
View(DATA)

install.packages("readxl")
library(readxl)

excel_data_ex <- read_excel("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.xlsx")
view(excel_data_ex)

ex_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt")
View(ex_data)

ex_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt",
                      header=TRUE)
View(ex_data)


ex1_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt",
                      header=TRUE,sep=",")
View(ex1_data)


ex2_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt",
                       header=TRUE,skip=2)
View(ex2_data)

ex3_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt",
                       header=TRUE, nrows=7)
View(ex3_data)

varname <- c("ID","SEX","AGE","AREA")

ex4_data <- read.table("C:/Users/user/Desktop/빅데이터개론/R study/4장source/data_ex.txt",
                     sep=",", col.names=varname)
View(ex4_data)


