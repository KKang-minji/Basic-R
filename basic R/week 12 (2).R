#code 7-17
head(iris)
table(iris$Species)
agg<-aggregate(iris[,-5], by=list(iris$Species),
            FUN=mean)
agg



head(mtcars)
agg<-aggregate(mtcars, by=list(cyl=mtcars$cyl,
      vs=mtcars$vs),FUN=max)
agg



#####병합 중요
#code 7-20
x <-data.frame(name=c("a","b","c"), math=c(90,80,40))
y <-data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y

merge(x,y, by=c("name"))

z <-merge(x,y, by=c("name"))
z

merge(x,y, by=c("name"),all.x=T)
merge(x,y, by=c("name"),all.y=T)
merge(x,y, by=c("name"),all=T)



########중요한 함수 (merge)
x <-data.frame(name=c("a","b","c"), math=c(90,80,40))
y <-data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x 
# 병합기준 열의 이름이name
y 
# 병합기준열의이름이sname 
merge(x,y, by.x=c("name"), by.y=c("sname"))

install.packages("treemap")

library(treemap) 
# treemap 패키지 불러오기

data(GNI2014) 
# 데이터 불러오기
head(GNI2014) 
# 데이터 내용보기
treemap(GNI2014,
        index=c("continent","iso3"),          # 계층구조 설정(대륙-국가)
        vSize="population",                   # 타일의 크기
        vColor="GNI",                           # 타일의 컬러
        type="value",                          # 타일 컬러링 방법
        bg.labels="yellow",                    # 레이블의 배경색
        title="World's GNI")




st <- data.frame(state.x77)     # 매트릭스를 데이터프레임으로 변환
symbols(st$Illiteracy, st$Murder,   # 원의 x, y 좌표의 열
        circles=st$Population,    # 원의 반지름의 열
        inches=0.3,              # 원의 크기 조절값
        fg="white",                 # 원의 테두리 색
        bg="lightgray",          # 원의 바탕색
        lwd=1.5,                    # 원의 테두리선 두께
        xlab="rate of Illiteracy",
        ylab="crime(murder) rate",
        main="Illiteracy and Crime")
text(st$Illiteracy, st$Murder,   # 텍스트가 출력될 x, y 좌표
     rownames(st),             # 출력할 텍스트
     cex=0.6,                  # 폰트 크기
     col="brown")











