/* 생성된 코드(가져오기) */
/* 소스 파일: 청년실업률_시도__20190402105517.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 5. 14. 오후 3:13 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/청년실업률_시도__20190402105517.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	GETNAMES=YES;
RUN;



proc transpose data =a1 out= ddd;

var _2014_1_4 _2014_1_4 _2014_1_4 _2014_1_4 _2014_1_4 _2014_1_4 
_2015_1_4 _2015_1_4 _2015_1_4 _2015_1_4 _2015_1_4 
_2015_1_4 _2015_1_4 _ 


run;
proc plot data =ddd;
plot (col1 col2)*_label_ / overlay;
run; quit;

FILENAME REFFILE '/folders/myfolders/3. SAS 데이터의 요약.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a2;
	sheet='관계요약';
	GETNAMES=YES;
RUN;

**가설검정 한집단 ;
proc ttest data = a2 h0=10 alpha=0.05; *ttest= 분석툴, h0=가설, alpha=기준;
    var cow;
 run;


data a3;
   set a2;
    diff=cow-pig;
    run;
    
    proc ttest data = a3;
     var diff;
     run;
     
proc ttest data=a2;
   paired cow*pig;
run;


data pin;
  input variety $ ppp @@;
  cards;
  A 4 A 7 A 5 A 8 A 6
  B 3 B 1 B 2 B 5 B 4
  C 4 C 2 C 5 C 4 C 6
  ;
  run;

proc ttest data =pin;   *ttest는 집단 두개까지만 됨;
  class variety;
  var ppp;
run;  

proc  anova data = pin;
class variety;
model ppp = variety ;
run;


*ttest할려면 data가 pin을 봤을 때 (두집단일때) ttest 할 수 있었음
1. cowㅎㅏ고 pig 두집단의 평균이 같은지 아닌지 ttest하고 싶음
2. 분산분석 기초자료 (집단 4개)의 컬럼을 아노바는 class의 변수가 있어야지만 
그자료는 class가  니만들어서 anova도출;



*1;
data cow;
set a2;
gubun = 'cow';
rename cow = value;
keep cow gubun; *value가 아니라 cow임;
run;
*cow랑 pig랑 공통된 칸에 넣으려고 value로 바꿈;

data pig;
set a2;
gubun = 'pig';
rename pig = value;
keep pig gubun;
run;

data a3;
set cow pig;
run;

proc ttest data = a3;
var value; *숫자, 양적자료;
class gubun; *문자, 질적자료;
run;

*0.05보다 크니 귀무가설 채택. 즉 cow와 pig는 같다;

*두번째 방법;

proc transpose data = a2 out= a4; *열과행을 바꿈;
by country; *열이름 지정;
var cow pig; *열 안에 데이터 넣기;
run;

proc ttest data = a4;
class _LABEL_;
var COL1;
run;




FILENAME REFFILE '/folders/myfolders/분산분석 기초자료.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.aa1;
	sheet='1';
	GETNAMES=YES;
RUN;


data b1;
set aa1;
grade = '1';
rename var1 = value;
keep var1 grade;
run;

data b2;
set aa1;
grade = '2';
rename var2 = value;
keep var2 grade;
run;

data b3;
set aa1;
grade = '3';
rename var3 = value;
keep var3 grade;
run;

data b4;
set aa1;
grade = '4';
rename var4 = value;
keep var4 grade;
run;

data bb1;
set b1 b2 b3 b4;
run;

proc  anova data = bb1;
class grade;
model value = grade ;
run;





PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);