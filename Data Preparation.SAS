/* Before starting Work copy dataset such that you do not miss the data 

/*1. Read xlsx data with SAS*/


libname LL '/folders/myshortcuts/My_folder/SASCOURSE/data';

proc import datafile='/folders/myshortcuts/My_folder/SASCOURSE/data/SuperStoreUS_2015.xlsx' out=LL.import
dbms=xlsx Replace;
Getnames=yes;
datarow=2;
run;

/* 2. export data*/

proc export data=LL.import
outfile='/folders/myshortcuts/My_folder/SASCOURSE/data/SuperStoreUS.xlsx' dbms = xlsx replace;
run;


/* 3. view the list of variables or dimension of datasets in SAS;*/


proc contents data=LL.import;
run;

/* 4. View all datasets by datasets command in SAS*/

proc datasets lib=LL;
run;

/* 5. first few records view in SAS command*/

data import;
 set LL.import(obs=3);
 ;
run;

/* 6. Last few records view in SAS command*/

data import;
 set LL.import nobs=nobs;
 a=_n_;
 if _n_>nobs-3 ;
run;



/* 7. Rename variable with different tecniques*/ 

data import(rename=(City=CT));
set LL.import;
rename Customer_ID=Id;

run;

/* 8. check updated variables with proc contents*/

proc contents data=import;
run;

/* 9. Variables' order change in dataset with retain function*/

data import;
retain  order_priority row_id;
set LL.import;
run;

/* 10. data slicing in SAS*/

data import;
retain obs;
set LL.import;
obs=_n_;
IF(20<obs<30) THEN output;
run;

/* 11. data Rounding in SAS*/

data import;
set LL.import;
new_sales=round(sales*.13,.1);
run;

/* 12. Sorting in SAS*/

proc sort data=import;
by sales;
run;

/* 13. Create new variable with if else statement in SAS*/

data import;
set import;
if sales>200 then newsales='good';
else newsales='bad';
run;

/* 14. replace value with NA in SAS*/

data import;
set import;
if sales<200 then n_sales='N/A';
else n_sales=sales;
run;

/* 15. Records removing from datasets with SAS*/

data import;
set LL.import;
if sales=>200 then output;
run;

new_variable = input(original_variable, informat.);

data import;
set import;
charsales=sales;
new_variable = put(charsales,$4.);
run;

proc contents data=import;
run;

/* 16. data convert into numeric*/

data import;
set import;
ss=charsales;
ss_variable = input(ss,12.);
run;


/* 17. User define proc format*/

data LL.imports;
set LL.import(obs=10);
if sales<200 then n_sales=1;
else if 500>sales<200 THEN n_sales=2;
else n_sales=3;

run;

/* proc contents data=LL.imports;
run;*/

/* 18. duplicate remove with nodup and nodupkey*/

data best;
 input patient 1-2 arm $ 4-5 bestres $ 6-7 delay 9-10;
 datalines;
01 A CR 0
02 A PD 1
03 B PR 1
04 B CR 2
05 C SD 1
06 C SD 3
07 C PD 2
01 A CR 0
03 B PD 1
 ;
run;

proc sort data=best nodup out=nobest;
by patient;
run;

proc sort data=best nodup out=nobest;
by patient arm;
run;

proc sort data=best nodupkey out=nobest;
by patient;
run;

proc sort data=best nodupkey out=nobest;
by  arm delay;
run;


/* joining and Mergning in SAS*/


/* Create data set*/
Data A;
Input ID Name$ Height;
cards;
1 A 1
3 B 2
5 C 2
7 D 2
9 E 2
;
run;

Data B;
Input ID Name$ Weight;
cards;
2 A 2
4 B 3
5 C 4
7 D 5
;
run;

proc sort data=a;
by id;
run;

proc sort data=b;
by id;
run;


data dummy;      
merge a (in=x) b(in=y);
by id;
a = x;
b = y;
run;

/* 19.data Merging/blending*/

data abmerge;
merge a (in=x)b(in=y);
by id;
a=x;
b=y;
run;

/* 20.Inner Join*/


proc sort data=a;
by id;
run;

proc sort data=b;
by id;
run;

data innerjoin;

merge a(in=x)b(in=y);
by id;
if x and y;
run;


/*21.lef join */

proc sort data=a;
by id;
run;

proc sort data=b;
by id;
run;

data leftjoin;
merge a (in=x)b(in=y);
by id;
if x;
run;


/* 22.right join */

proc sort data=a;
by id;
run;

proc sort data=b;
by id;
run;

data rightjoin;
merge a(in=x)b(in=y);
by id;
if y;
run;


/* 23.union in SAS*/

data uniondata;
set a b;
run;

/*24. data wright or save as a txt xlsx csv*/

proc export data=LL.import
outfile='/folders/myshortcuts/My_folder/SASCOURSE/data/SuperStoreUS.xlsx' dbms = xlsx replace;
run;

proc export data=uniondata 
outfile='/folders/myshortcuts/My_folder/SASCOURSE/data/ab.xlsx' dbms = xlsx replace;
run;

proc export data=uniondata outfile='/folders/myshortcuts/My_folder/SASCOURSE/data/ab.csv' dbms=csv replace;
run;

proc export data=uniondata outfile='/folders/myshortcuts/My_folder/SASCOURSE/data/ab.txt' dbms=tab replace;
run;


/*Data Lebeling in SAS*/

DATA auto ;
  INPUT make $  mpg rep78 weight foreign ;
CARDS;
AMC     22 3 2930 0
AMC     17 3 3350 0
AMC     22 . 2640 0
Audi    17 5 2830 1
Audi    23 3 2070 1
BMW     25 4 2650 1
Buick   20 3 3250 0
Buick   15 4 4080 0
Buick   18 3 3670 0
Buick   26 . 2230 0
Buick   20 3 3280 0
Buick   16 3 3880 0
Buick   19 3 3400 0
Cad.    14 3 4330 0
Cad.    14 2 3900 0
Cad.    21 3 4290 0
Chev.   29 3 2110 0
Chev.   16 4 3690 0
Chev.   22 3 3180 0
Chev.   22 2 3220 0
Chev.   24 2 2750 0
Chev.   19 3 3430 0
Datsun  23 4 2370 1
Datsun  35 5 2020 1
Datsun  24 4 2280 1
Datsun  21 4 2750 1
;
RUN;
PROC CONTENTS DATA=auto;
RUN;


data Auto3;
set Auto;
label rep78='1978 Repair Record'
      mpg='Miles Per Gallon'
      foreign='Where Car was Made'
      ;
run;

proc contents data=Auto3;
run;

proc means data=Auto3;
run;

Proc Format;
Value forgnf 0="dm"
              1="fn" ;
             
value $makef   "AMC" ="American Motors"
                "Buick"  ="Buick (GM)"
                "Cad."   ="Cadillac (GM)"
                "Chev."  ="Chevrolet (GM)"
                "Datsun" ="Datsun (Nissan)";
                
run;

proc FREQ data=auto3;
format foreign forgnf.
make    $makef.;
Tables foreign make;
run;






