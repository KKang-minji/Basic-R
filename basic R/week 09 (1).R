
#########while문
### code 4-12
sum<-0
i<-1
while(i <=100){
  sum<-sum+i     #sum에 i값을 누적
  i<-i+1         # i값을 1증가시킴
}
print(sum)

###code 4-13
sum<-0
for(i in 1:10) {
  sum <- sum + i
  if(i >= 5) break
}
sum

#while문 
sum<-0
i<-1
while (i <=10){
  sum<- sum+i
  if(i>=5) break
  i<- i+1
}
sum

#반복문의 시작으로 되돌아가는 역할 , 다음반복을 수행
###code 4-14
sum<-0
for (i in 1:10) {
  if(i%%2==0)next
  (sum<- sum+i)
}
sum









