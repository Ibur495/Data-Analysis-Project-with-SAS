/**conditionally subsetting data set**/
data allstudent;
  input id $ English Math;
datalines;
001 78 80
002 56 70
003 74 46
004 80 90
;
run;

DATA student1;
 set allstudent;
 If English>60 and Math>60;
 /*If  English>60 and Math>60 then output; */
RUN;

DATA student2;
  set allstudent;
  where English>60;
  keep id  English;
RUN;

DATA student3;
   set allstudent;
   If math>70 then delete;
   drop English;
RUN;
