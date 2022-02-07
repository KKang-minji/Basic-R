 *각주는 앞에 별달고 뒤에 세미콜론 넣어야됨(*+;);
 *데이터 이름은 kkk(변수명과 데이터는 우리가 정해서 붙여주는 이름);
 *data, proc으로 시작;
 *;= 내명령의 한줄 끝남;
data kkk;
*한줄에 하나의 데이터만 인식함 하지만 띄어쓰기+@@하면 괜찮음;
*두개 이상의 데이터결과를 얻으려면 input 뒤에 그 데이터명을 나열하고 cards밑에 데이터 한줄씩 나열;
  input score1 score2 @@;
  *cards= 데이터와 명령구분, 데이터 시작;
  cards;
  100 90 80 70 60 
  40 50 60 70 80
*마지막;는 데이터 끝내겟다는 뜻;
  ;
  run;
  *ctrl+s= 저장;
  
  *1;
  data stat1;
  input group$scores1$score2;
  cards;
 문자형 숫자형 숫자형
 A 10 9
 B 8 7
 C 7 6
 D 9 8
  ;
  run;
  
*2;
*(1);  
data A1;
  input grade$score;
  cards;
  1학년 score1
  2학년 score2
  3학년 score3 
  4학년 score4 
   ;
  run;
  
data A2;
  input grade$score;
    cards;
  1학년 score1
  2학년 score2
  3학년 score3 
  4학년 score4 
   ;
  run;
  
data A3;
 input grade$score;
    cards;
  1학년 score1
  2학년 score2
  3학년 score3
  4학년 score4 
   ;
  run;
    
 
data AAA;
   set A1 A2 A3;
   run;
   
*(2);   
data z;
  set AAA;
  if a1=score1-5;
  else if a2=score2-5; 
  else if a3=score3/0.9;
  else if a4=score4/0.9; 
  run;

*(3);
data b1;  
set AAA;
 grade = substr(grade,1,1);
run;   

data b2;  
set AAA;
 grade = substr(grade,2,2);
run;   

data b3;  
set AAA;
 grade = substr(grade,3,3);
run;      

data b4;  
set AAA;
 grade = substr(grade,4,4);
run;      
   

*4;
   
data data1;
set ; 



*6;
*(1);
drop ;


*(2);

e***-3;
 
*(3);
substr(문자형 변수, 시작, 자리수); 
find(검색대상 변수, 찾으려는 문자열, 수정자, 시작위치);

*(4);
rename 기존변수명=변경이름;

*7;
*(1);

*(2);
data gg;
input grade$gender;
cards;
test1 tset2
;
run;

proc means data = test1 n min max median maxdec =1;
class grade gender;

run;

proc means data = test2  n min max median maxdec =1;
class grade gender;
run;







