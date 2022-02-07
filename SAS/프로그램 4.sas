/* 생성된 코드(가져오기) */
/* 소스 파일: 2. index 실습.xlsx */
/* 소스 경로: /folders/myfolders */
/* 코드 생성일: 20. 4. 23. 오후 2:05 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/2. index 실습.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.index;
	sheet '346';
	GETNAMES=YES;
RUN;

data index1;
   set import;
   if var10 in ('') then delete; 
  run;            
   
 data address1;
 set index1;
 if index(var10, '서울') then region='01';
else if index(var10, '대전') then region='02';
else if index(var10, '인천') then region='03';
else if index(var10, '광주') then region='04';
else if index(var10, '부산') then region='05';
else if index(var10, '대구') then region='06';
else if index(var10, '경기') then region='07';
else if index(var10, '전라') then region='08';
else if index(var10, '경상') then region='09';
else if index(var10, '강원') then region='10';
else if index(var10, '충청') then region='11';
else if index(var10, '제주') then region='12';
else if index(var10, '울산') then region='13';
else region='';
run;
 



 
PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

