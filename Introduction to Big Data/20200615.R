rm(list=ls())
install.packages("reshape2")
library(reshape2)

names(airquality) <- tolower(names(airquality))
aq_melt <- melt(airquality, id= c("month", "day"), na.rm = TRUE)
aq_melt

acast(aq_melt, day~month~variable)

acast(aq_melt, month~variable, mean)



###9강
library(dplyr)
mtcars
filter(mtcars, cyl==4) #mtcars에서 cyl값이 4인 행만 추출
filter(mtcars, cyl>= 6 &mpg>20)

arrange(mtcars,wt) #wt를 기준으로 오름차순 정렬
arrange(mtcars, mpg, desc(wt)) #mpg를 기준으로 오름차순 정렬후 mpg동일값에  대해서 wt를 기준으로 내림차순


select(mtcars, am, gear)
head(select(mtcars, am, gear))

mutate(mtcars, year = "1974") #데이터 세트에 열을 추가
mutate(mtcars, mpg_rank= rank(mpg)) #동일 값이 있을 때는 평균으로 계산

mtcars$cyl
distinct(mtcars, cyl)
mtcars$gear
distinct(mtcars, gear)

distinct(mtcars, cyl, gear)  #cyl과 gear지정열의 모든 값이 동일할 때만 제거하기


#summarise함수는 통계 함수와 함께 사용하며 데이터를 요약할 때 사용
summarise(mtcars, cyl_mean =mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n())

group_by(mtcars, cyl) %>% summarise(n()) #함수와 함수를 연결하는 %>%연산자

gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, mean(mpg)) #실린더 개수별 연비평균

sample_n(mtcars, 10) #10개의 샘플 데이터 추출
sample_frac(mtcars, 0.2) #20%를 샘플 데이터로 추출(32개 중 20%인 6개 샘플추출)






