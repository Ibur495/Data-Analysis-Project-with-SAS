/***copy data set using set statement****/
Data student;
  Input name $ gender $ score1 score2;
Datalines;
SMITH M 70 66
Jaycee M 57 59
LEE  M 68  70
Larry M 58 80
Jack F 89 78
Jerry M 52 69
;
Run;

Data student1;
 Set student(FIRSTOBS=2 Obs=4);
Run;
