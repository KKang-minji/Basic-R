/* 생성된 코드(가져오기) */
/* 소스 파일: 6. 분산분석.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 5. 28. 오후 2:10 */

%web_drop_table(WORK.IMPORT);


****시트 붙이기;

FILENAME REFFILE '/folders/myfolders/6. 분산분석.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	sheet = '1';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
   DBMS=XLSX
   OUT=WORK.a2;
   sheet = '2';
   GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
   DBMS=XLSX
   OUT=WORK.a3;
   sheet = '3';
   GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
   DBMS=XLSX
   OUT=WORK.a4;
   sheet = '4';
   GETNAMES=YES;
RUN;

data aa;
set a1 - a4;
run;

***1. ttest : sex 2개;
***2. anova : grade 4개;
***3. anova 는 두개도 가능; 

proc ttest data =aa;   *ttest는 집단 두개까지만 됨;
  class sex;
  var score ;
run;  

proc  anova data = aa;
class grade;
model score = grade ;
means grade/ lsd alpha=0.1;
run; quit;

proc  anova data = aa;
class sex grade;
model score = sex grade;
sex*grade;
means sex grade/ lsd alpha = 0.05;
run;
quit;


data aa1;
input x y @@;
   cards;
   -5 -4 -4 -5 -3 -2 -2 0 -1 -1 0 0
   1 3 2 4 3 5 4 7 5 10
   ;
   run;
proc plot data=aa1;
  plot x*y;
  run; quit;


*단순선형회귀분석;

proc reg data= aa1;
  model y =x;
run;

proc reg data=aa1;
  model y=x;
  output out = aaa predicted=yhat;
  run;
  proc print data=aaa; run;

proc plot data =aaa;
plot y*x yhat*x/ overlay;
run; quit;


*절편제거;
proc reg data= aa1;
  model y =x/noint;    *noint=절편값;
run;



data g;
input x1 x2 y@@;
cards;
-5 12 -4
-4 20 5
4 -5 -3
-2 -3 0
3 9 3
-3 6 -8
0 0 0
0 6 -7
2 -4 8
5 7 20
19 -4 -8
-4 -16 6
4 -2 10
8 9 13
-4 8 2
;
run;

proc glm data= g;  *reg로 했다가 오류나서 glm으로 함;
  model y= x1 x2 x1*x2;
  output out =aaa predicted=yhat;
  run;
proc print data= aaa;  run;



PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);