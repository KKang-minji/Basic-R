##########3.2 데이터 프레임 data.frame
### list
x<-c(1,2,3,4,5)
x

l<-list(1:5,'a',T)
l

#list에 있는 몇번째 원소라는 것을 알려주는ㄴ 것은 대대괄호 대괄호는는 그가값


###Indexing lists
# Elements indexing operator:[[...]]:벡터로 추출됨(원소를 꺼내서 가져오는 것)
lst.element<-l[[1]]
lst.element
class(lst.element)
mode(lst.element)

# sublists indexing operator:[...]: 리스트로 추출
lst.sub<-l[1]
lst.sub
class(lst.sub)

#elements indexing operator와 sublists indexing operator의 차이
mean(l[[1]])
mean(l[1])

###리스트 원소의 이름 지정
lst.named<- list('x'=1:5,'y'='a','z'=T)
lst.named<- list(x=1:5,y='a',z=T)
lst.named     # $표시는 원소의 이름을 뜻함

lst.named$x
lst.named[[1]]
lst.named[['x']]

### 데이터 프레임
x<-1:5
y<-letters[1:5]
z<-c(T,F,T,F,F)
lst<-list(x,y,z)
lst

df<-data.frame(x,y,z)
df

#list는 하나씩하나씩 가로로 나열
#data.frame은 세로로 나열

class(lst)
class(df)
mode(lst)
mode(df) #보여질때는 df로 보여지지만 실제로 계산 할때는 list다.

### indeximg data.frame
# 리스트의 인덱싱 사용
df[[1]]
df$x
df[['x']]
# 매트릭스의 인덱싱 사용
df[3,2]







