stem(exdata1$AGE)
hist(exdata1$AGE)

hist(exdata1$AGE, breaks = c(0,20,40,60), main = "AGE") #막대의 간격 값지정
hist(exdata1$AGE, breaks = seq(0,60,by=10), main = "AGE") #seq함수를 써서서
hist(exdata1$AGE, breaks = seq(0,60,by=10), main = "AGE", freq = FALSE)
#막대 값을 도수 대신 분포 밀도로 나타내기
hist(exdata1$AGE, freq = FALSE, xlab = "나이", ylab = "밀도", main = "나이대별 밀도", xlim=c(0,70), ylim=c(0,0.05))


freq(exdata1$SEX, plot = T, main = '성별(barplot)')
freq(exdata1$SEX, plot = T, main = '성별(barplot', xlab = "SEX", ylab = "빈도", ylim=c(0,10))

library(readxl)
exdata1 <- read_excel("C:/Users/user/Desktop/bigdata/Sample1.xlsx")
exdata1

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT)

boxplot(exdata1$Y17_CNT, exdata1$Y16_CNT, main = 'CNTBoxplot', xlab = "16vs.17", ylab= "분포",
         names = c("Y17_CNT", "Y16_CANT"), ylim= c(0,60), col = c("cornsilk", "darkgray"))



