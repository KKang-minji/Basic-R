rm(list=ls())
install.packages("reshape2")
library(reshape2)

airquality
head(airquality)
names(airquality) <- tolower((names(airquality)))#대분자를 소문자로 바꿈
head(airquality)

melt_test <- melt(airquality)
melt_test
head(melt_test)
tail(melt_test)

#월과 바람을 기준으로 오존값만 출력
melt_test2 <- melt(airquality, id.vars = c("month","wind"), measure.vars = "ozone")
melt_test2
head(melt_test2)

#월과 일을 식별자, 나머지 열을 행으로 변환하고 결측값을 포함하도록 (na.rm)
aq_melt <- melt(airquality, id= c("month", "day"), na.rm = TRUE)
aq_melt
head(aq_melt)

#월과 일을 식별자로 지정하고 variable열에 잇는 데이터를 열로 변환
aq_dcast <- dcast(aq_melt,month+day ~ variable)
aq_dcast
head(aq_dcast)

acast(aq_melt, day~month~variable)

acast(aq_melt, month~variable,mean)


































