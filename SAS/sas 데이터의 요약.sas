/* 생성된 코드(가져오기) */
/* 소스 파일: 3. SAS 데이터의 요약.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 4. 28. 오전 11:11 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/3. SAS 데이터의 요약.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	sheet='수치요약'
	GETNAMES=YES;
RUN;


FILENAME REFFILE '/folders/myfolders/3. SAS 데이터의 요약.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a2;
	sheet='관계요약';
	GETNAMES=YES;
RUN;

*수치요약: 학번구분/mod명령어 검색- 학번이 짝수 여자/홀수 남자;

data b1;
   set a1;
   id1 = substr(id,1,4);
   if mod(id,2)=0 then gender ='여자';   *mod= 예를들어 20151268 을 2로 나눠서 나머지가 0이면 남자로 하고 나머지는 ㅇㅕ자로한다. 이런식;
   else gender = '남자';
   run;


proc freq data = b1;
   table id1 gender id1*gender; *내가 만든변수로 테이블만듦;
   run;

proc means data = b1;
   var first;
   class id1 gender; *id별로,gender별로; *한명이면 표준편차 없음;
   run;
   
proc corr data =b1; *corr=상관계수;
   var first second third; *상관계수가 1이면 두개의 변수가  같다는것;
   run;              *-1~1까지 (ex. 0.96이면 상관계수가 높다. 첫번째 시험이 잘본사람이 두번째 시험도 잘본다.);
   

*그래프;
proc plot data=b1;
  plot first*second second*third;
  run; quit;

proc plot data=b1;
  plot first*id1 second*id1 / overlay; *overlay=한 그림에 여러 그래프를 겹쳐그림;
  run; quit;
  
  
proc summary data =b1;
 class gender;
 var first second third;
 output out = aaa sum=;
run;  
  

proc summary data =b1;
   class id1 gender;
   var first second third;
   output out = aaa mean=;
run;

proc summary data =b1 nway;  *nway= 조합별로 볼수있음;
   class gender;
   var first second third;
   output out = aaa mean=;
run;

proc univariate data = b1 plot;      *univariate=훨씬 많은 검정을 할  수 있음;
 var first;        *plot= 그래프;
 class gender;
 run;





proc corr data =a2; 
   var COW PIG EGG MILK FISH CORN BREAD FRUIT ETC; 
   run;     


proc plot data=a2;
  plot COW*(PIG EGG MILK FISH CORN BREAD FRUIT ETC); 
  run; quit;



*****************************************************************************;

data b;
  input x @@;
  cards;
  0 1 2 3 4 5 6 7 8 9 10
  ;
  run;
  
*이항분포 x~B(10,0.3);  
*pdf = (이름, 벼ㄴ수,확률 ,시행횟수)확률 분포 함수;
*binomial= 모수 두개;
data b2;
  set b;
  p1= pdf('binomial',x,0.3,10);
  p2= cdf('binomial',x,0.3,10); *누적으로됨;
run;
  
*포아송분포 x~poisson(5);
*ex) 1시간동안 들어오는 전화수 , 스타벅스 한시간동안 들어오는 차량수..;  
*poisson=모수 1개;
data b3;
  set b;
  p1= pdf('poisson',x,5);
  p2= cdf('poisson',x,5); *누적으로됨;
run;
 
 
*정규분포; 
data c;
  input x @@;
  cards; 
  -3 -2 -1 0 1 2 3
  ;
  run;
*표준정규분포;   
data c1;
  set c;
  p1 = pdf('normal',x,0,1);
  p2 = cdf('normal',x,0,1);
  p3 = probnorm(x);
run;

*확인;
*그래프;
proc plot data=c1;
  plot p1*x p2*x / overlay; *overlay=한 그림에 여러 그래프를 겹쳐그림;
  run; quit;
  
proc plot data=c1;
  plot p2*x p3*x / overlay; 
  run; quit;
*두개의 그래프가 같음(완전히 겹쳐서 그려짐);



data n;
  x=1; *시작점;
  do i = 1 to 100 by 0.1; *1부터 100까지; *0.1씩;
  x = i+1;
  output;
  end;
run;


data n1;
  x= 1;
  do i = 1 to 10000;
  x = rannor(0);  *표쥰정규분포 0~1중에서 만개 뽑아봐; 
  output;
  end;
run;  


data n2;
  set n1;
  p1 = pdf('normal',x,0,1);
  p2 = cdf('normal',x,0,1);
run;

proc plot data=n2;
  plot p1*x p2*x / overlay; *overlay=한 그림에 여러 그래프를 겹쳐그림;
  run; quit;



data n1;
  x= 1;
  do i = 1 to 10000;
  z = rannor(0);  *표쥰정규분포 0~1중에서 만개 뽑아봐; 
 *x~N(10,10^2);
 x= 10+ z*10;  *Z=(X-M)/10(시그마) ->  Z*10=X-M ->  X=Z*10+M ;
  output;
  end;
run;  


data n2;
  set n1;
  p1 = pdf('normal',x,10,10);
  p2 = cdf('normal',x,10,10);
run;

proc plot data=n2;
  plot p1*x ; *overlay=한 그림에 여러 그래프를 겹쳐그림;
  run; quit;
















PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	sheet='관계요약';
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);