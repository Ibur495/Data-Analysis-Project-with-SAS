/***examples of retain statement****/

Data sales_month;
  Input month sales;
Datalines;
1 1256
2 2345
3 1357
4 1789
5 2345
6 1988
;
Run;

Data sales_cum;
  Set sales_month;
  Retain cum_sales;
  If _n_=1 then cum_sales=sales;
  Else cum_sales=cum_sales + sales;
Run;


Data shopping;
 Input customer_id buy $ time: date9.;
 Format time ddmmyy10.;
Datalines;
 2 Clothes '11Jun2001'd
 1 Food    '15May2001'd
 5 Staple  '03Jul2001'd
 1 Food    '12Jun2001'd
 2 Staple  '23Aug2001'd
 3 Food    '19Feb2001'd
 2 Clothes '03May2001'd
 3 Food    '14Apr2001'd
 4 Staple  '22Sep2001'd
 5 Clothes '11Jun2001'd
 ;
Run;
PROC sort data=shopping;
   By customer_id time;
Run;

PROC print data=shopping;
Run;


Data shopping_sum;
   Set shopping;
   By customer_id time;
   Array shopitem{3} $ shopitem1-shopitem3;
   Array shoptime{3} shoptime1-shoptime3;
   retain shopitem1-shopitem3 shoptime1-shoptime3 counter;
   If first.customer_id=1 then do n=1 to 3;
     counter=1; shopitem{n}=''; shoptime(n)=.;
   End;
   shopitem{counter}=buy;
   shoptime{counter}=time;
   counter=counter+1;
   If last.customer_id=1 then do;
      output;
   End;
   Format shoptime1-shoptime3 ddmmyy10.;
   Keep customer_id shoptime1-shoptime3 shopitem1-shopitem3;
Run;
