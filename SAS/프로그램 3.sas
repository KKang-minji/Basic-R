/* 생성된 코드(가져오기) */
/* 소스 파일: 2. SAS 데이터의 활용(변경).xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 4. 16. 오후 2:29 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용(변경).xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

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

*데이터 정렬;
proc sort data = a1; by id;   *id로 붙일려고해서 by id;
  run;
proc sort data = a2; by id; run;
proc sort data = a3; by id; run;
proc sort data = a4; by id; run;
*(숫자가 낮은것부터 높은것 순으로 오름차순으로 정렬 됨);


*참고 옵션* descending; *ascending;
*참고 옵션* out = ;

*id똑같은거 가져와서 옆에 성적 붙임(엑셀 sheet2,3,4 를 아이디별로 옆에 붙임);
data aaa;
   merge a2(in=a) a3(in=b);  *a2에서 들어오는 데이터는 a 는 꼬리표를 달아놔;
   by id;    *기준을 붙여줌;
   *if a;    *a기준으로 ;
   *if b;    *b기준으로;
   if a&b;   *교집합 ;

run;   

*a4를 하나 더 붙여요;
*1. 전체  기준으로 붙이세요 -48개를 유지하세요;
*2. 1,2,3번째 시험을 보신분만 ;
*중간중간 빈칸이 있는 상태의 엑셀을 붙일때;
data aaa1; 
  merge a2(in=a) a3(in=b) a4(in=c);
  by id;
  if a;       *'a'에만 있다면 다 붙여라, 없는 애들도 다 붙음 그래서 없는애는 '.'라고 뜸;
  run;
  
  data aaa2;
  merge a2(in=a) a3(in=b) a4(in=c);
  by id;
  if a&b&c;   *미씽벨류 없어짐 없으면 붙이지 않음, 있ㄴㅡㄴ 애들만 붙임;
  run;
  
data aa3;
  set aaa2;
  m1 =(first+second+third)/3;
  m2 = mean(first, second, third);
  m3 = max(first, second, third);  
  m4 = min(first, second, third);
  m5 = median(first, second, third);  
  
  m6 = mean(m3,m5);
  m7 = mean(m5,m4);
  *제일 못 본 하나 없애고 잘 본 2개 평균 구하기
제일 잘 본 하나 없애고 못 본 2개 평균 구하기;
  run;
  
data aa4;
  set aaa2;
  m8 = mean( max(first, second, third),median(first, second, third));
  *m9 = mean(min(first, second, third),median(first, second, third));
    *위에 m6,m7구하는거 한번에 구하는 방법;
    
    if m6 >90 then grade ='A';
    else if m6 >80 then grade ='B';
    else if m6 >70 then grade ='C';
    else if m6 >60 then grade ='D';
    else grade ='F';
  
run;


proc freq data = aa4;
   table id*grade;
   run;
   
*과제* 학번별로 등급의 분포는 어떻게 되는가?;
*id = 20114567;
*주민번호-> 나이 계산, 성별;
*id에서 학번을 구분하는 방법은?;  
*구분 변수 가지고 학점 등급 분포 확인;  

data aa5;
set aa4;
id1= substr(id,1,4); *변수명은 영어, 따옴표안됨;
id2= substr(id,3,2); *substr(변수명,첫번째, 마지막);
run; 


proc freq data = aa5;
   table id1*grade; *내가 만든변수로 테이블만듦;
   run;


proc freq data = aa5;
   table id2; *내가 만든변수로 테이블만듦;
   run;
   
   
data b2;
  set aa5;
  if id2 in('11' '12' '14');
  run;
   
*dept에서 경상대학/비즈통계만 뽑아오기; 
data b3;
  set aa5;
  if dept in('경상대학/비즈통계');
  run;
   
   
*dept에서 경상대학/비즈통계만 제외하고 뽑아오기;    
data b4;
  set aa5;
  if dept not in('경상대학/비즈통계'); *drop은 변수들끼리만됨, 변수안의 수는 안됨;
  run;

data b5;
   set aa5;
   if index (dept,'통계'); *index = dept에 들어가서 통계라고만 되어있으면 다 가져와라;
  run;                     
   




  
  
  
  
  

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);