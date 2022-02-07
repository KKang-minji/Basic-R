/* 생성된 코드(가져오기) */
/* 소스 파일: 2. SAS 데이터의 활용.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 4. 14. 오전 11:11 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a1;
	sheet = '1';
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a2;
	sheet = '2';
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.a3;
	sheet = '3';
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/2. SAS 데이터의 활용.xlsx';

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
   merge a2 a3 a4;  *가로로 붙일때 merge; *세로는 set;
   by id;    *기준을 붙여줌;
run;   

*과제* 변수명이 다른 경우 어떻게 붙일 것  ;
*변수명이 다른 a1을 aaa로 이름 바꿈;
*1;
data aaa;      
set a1;
rename
var2= dept 
var3= id
var4= email;
run;

*id를 기준으로 정렬;
proc sort data = aaa;
by id; 
run;

*a1을  aaa로 바꿨으므로 a1데이터이름 대신 aaa라고 씀;
data bbb;
merge aaa a2 a3 a4; 
run;
 

  





PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);