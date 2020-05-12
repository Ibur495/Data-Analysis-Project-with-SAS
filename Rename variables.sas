/**Learn how to rename variables in data sets**/

Data student_score;
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


Data new_student1;
  Set student_score;
  Rename gender=sex;
  If name='Jack' then gender='M';
Run;


Data new_student2;
  Set student_score (rename=(gender=sex));
  If name='Jack' then sex='M';
Run;



Data new_student3 (rename=(gender=sex));
  Set student_score;
  If name='Jack' then gender='M';
 Run;
