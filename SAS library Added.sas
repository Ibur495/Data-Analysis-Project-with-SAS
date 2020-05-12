
/****an example to show how to create a permanent data set in a library******/

libname L 'C:\SASCOURSE\tempdata';

Data L.student_score;
  Input name $ age mark;
Datalines;
John 20 80
Marry 19 90
;
Run;
