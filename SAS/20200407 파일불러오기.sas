/* 생성된 코드(가져오기) */
/* 소스 파일: 1. SAS 구조의 이해 데이터.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 4. 7. 오전 11:49 */



FILENAME REFFILE '/folders/myfolders/1. SAS 구조의 이해 데이터.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/1. SAS 구조의 이해 데이터.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT1;
	SHEET = 'DEPT';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT2;
	SHEET = 'normal';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	SHEET = '1';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a2;
	SHEET = '2';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a3;
	SHEET = '3';
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a4;
	SHEET = '4';
	GETNAMES=YES;
RUN;

data all;
   set a1 a2 a3 a4;
run;

data aaa;
   set a1 a2;
run;

data bbb;
   set a3 a4;
run;

*사칙연산, 계산;
*논리연산;

data male;
set all;
if sex = 'm';      *문자는 항상'가 있어야함.;
run;
*freq= 빈도를 보고싶다는 것임;
proc freq data =all;
table sex;
run;

*학년별로 불러옴;
data grade1;
set all;
if grade = 'fresh';      *문자는 항상'가 있어야함.;
run;

data grade2;
set all;
if grade = 'sopho';      *문자는 항상'가 있어야함.;
run;

data grade3;
set all;
if grade = 'junio';      *문자는 항상'가 있어야함.;
run;

data grade4;
set all;
if grade = 'senio';      *문자는 항상'가 있어야함.;
run;

proc freq data =all;
table grade;
run;

proc freq data =all;
table grade sex grade*sex;
run;
*컬럼백분율은 세로로봣을때;


*한번에 데이터를 여러개 만듦. 위에 있는 grade1,2,3,4 한번에 만드는 방법임;
data g1 g2 g3 g4;
  set all;
  if grade = 'fresh' then output g1; *output은 내보내라는 뜻;
  else if grade ='sopho' then output g2;
  else if grade ='junio' then output g3;
  else if grade ='senio' then output g4;
  run;
  
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.normal;
	SHEET = 'normal';
	GETNAMES=YES;  

*표준정규분포;
*f(x)=1/sqrt(2*파이)*e의 -x**/2;
*x에 'normal' value를 넣어서 f(x)값을 구함;
data k;
   set normal;
   z1 = 2*3.14;
   z2 = sqrt(z1);      *sqrt()=루트;
   z3 = 1/z2;
   z4 = value**2;
   z5 = z4/2;
   z6 = exp(-z5);      *위 식의 e는 exp를 뜻함;
   fx = z3*z6;
 
   
   *drop z1 z2 z3 z4 z5 z6; *drop 이것들을  다빼버릴거다.;
   *keep value fx; *value 하고 fx만 가지고 있을 거야;
   run;

proc plot data = k;  *산점도 (gplot=그래픽한 산점도(더 섬세하게 이쁘게 결과 나옴));
 plot fx*value; *앞에 있는게 y축 뒤에 있ㄴ는게 x축;
 run; quit;

*과제* -3보다 작거나 3보다 큰 것들은 없애버리는 산점도를 그리세요;
*1;
data p;
set k;
if -3<=value<=3;
run;

proc plot data = p; 
plot fx*value;
run; quit; *proc은 Quit로 끝내야 완전히 끝남 안그러면 실행 상태임;

*2;
proc plot data = k; 
plot fx * value / HAXIS = -3 to 3 ; *haxis가 범위정하는 옵션;
run; quit;






PROC CONTENTS DATA=WORK.IMPORT; RUN;


