file <- choose.files()
file

data <- read.csv(file, header = T, skip=15, stringsAsFactors = F)
dim(data)
head(data)
tail(data)

summary(data)

###대전 추출
#중요
str<- "대전광역시 대덕구 대화동"
substring(str, 1,5)
substring(str, 1,2)


data.sub <- 
  subset(data,substring(시군구, 1,2)=="대전" & 건축년도>=2015)   

#기말고사 #시군구에서 대전만 뽑아내기 #건축년도 2015년 이후만
dim(data.sub)
head(data.sub)
tail(data.sub)

summary(data.sub)

#####건축년도
###막대그래프
tb<- table(data.sub$건축년도)
barplot(tb)

###원그림
pie(tb)

#######거래금액
###평균과 사분위수
summary(data.sub)

###히스토그램
hist(data.sub$거래금액, breaks = 20) #breaks= 는 막대를 쪼개는것

###상자그림
boxplot(data.sub$거래금액)

###그룹이 있는 상자그림
boxplot(거래금액~시군구, data= data.sub)

library(ggplot2)
ggplot(data.sub) +
  geom_boxplot(aes(x=시군구, y= 거래금액)) +
  coord_flip()# x,y축 바꿈

###산점도
plot(거래금액~전용면적, data=data.sub)

cols <- factor(data.sub$시군구) #factor은 문자형과 숫자형 같이 가지고잇음
cols <- as.numeric(cols) #숫자로 바꿈
cols

plot(거래금액~전용면적, data=data.sub, col=cols)

ggplot(data.sub) +
  geom_point(aes(x=전용면적, y=거래금액, color=시군구), size= 5)


