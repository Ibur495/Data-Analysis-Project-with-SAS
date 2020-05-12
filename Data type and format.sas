/****learn data type and format*****/

DATA work.Salary;
    INPUT ID  $9.  Year Salary  Tax;
    FORMAT Salary Tax dollar10.;
DATALINES;
A01232322  1998       52000  13090
A01343321  1999       57056  13780
A01355677  2000       62000  16000
A02553356  1998       32000  .
A02534344  1999       35000  6000
A02111345  1999       38000  8900
A03788900  1998               61001        .
A04350741  1999       50000  12000
;
RUN;

/****learn data type, format and informat*****/
DATA employee;
  INFORMAT fname lname $16.;
  INFORMAT income 12.1;
  INFORMAT BOD 8.;
  INPUT fname $ lname $ BOD income;
  FORMAT income dollar10.;
DATALINES;
Jack kok 19810102 89200.6
Marry smith 19901021 91900.5
Kevin melina 19721119 80000.8
Jane lee 19590721 793000.2
;
RUN;
