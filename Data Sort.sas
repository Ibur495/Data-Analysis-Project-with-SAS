/*****sort data sets*****/

Data Churn;
Input ID_NUM BILL_DATE CHURN_DATE: mmddyy10. CHURN_IND $ CURR_CHARGE_AMT PAST_DUE_AMT;
format BILL_DATE CHURN_DATE date9.;
Datalines;
4864 18784 03/11/11 Y 0 27
4865 18637 03/11/11 N 60 519
4865 18686 11/29/10 Y . 99
4866 18733 01/01/11 Y . 6
4867 18782 12/14/10 Y 79 567
4872 18784 01/12/11 Y 0 .
4873 18706 02/15/11 Y . 158
4877 18733 05/27/11 Y 306 601
4894 18859 08/03/11 Y 98 135
;
Run;

PROC sort data=Churn out= churn1;
  by BILL_DATE Descending CHURN_DATE;
Run;


Data sot;
  Input id $ name $ grade;
Cards;
002 John 56
004 Marry 80
002 David 90
004 Gary 80
001 Lida 70
002 John 56
;
Run;

PROC sort data=sot out= byd;
  By id;
Run;

/* Delete dup records */
PROC sort data=sot out= newsot nodupkey;
 By descending id;
Run;

PROC sort data=sot out=newsot1 noduprec;
 By descending id name;
Run;
