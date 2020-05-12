/******use labels on columns*********/
Data overdue;
  length id $200.;
  Input id $ m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12;
  Label id='customer id' m1='status for the first month';
  idd=id||"_";
Datalines;
001 0 0 0 0 1 0 0 0 1 0 0 0
002 0 0 0 0 0 0 0 0 0 1 0 0
003 0 0 0 0 0 0 0 0 0 0 0 0
004 0 1 0 0 0 0 0 0 0 0 1 0
005 0 0 0 0 0 1 0 0 0 0 0 0
006 1 0 0 0 0 0 0 0 0 0 0 0
;
Run;
