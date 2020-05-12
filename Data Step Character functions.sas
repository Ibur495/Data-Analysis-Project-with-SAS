/***practice character data step functions******/

Data address;
 Input name $11. @13 gender $1. address $16-45;
  First=scan(name,1); Last=scan(name,2);
 fullname=compbl(First||Last);
 /* or you can use */ fullname=CATX(" ",First,Last);
 postcode=scan(address,2);
 street=scan(address,1);
 FSA=substr(postcode,1,3);
 temp=index(street,'_')-1;
 street_num=substr(street,1,temp);
 drop temp;
 Datalines;
John smith  M  13_Allen_Rd M2J1V6
Kita  Chuo  F  1_Deter_Cres Q1D3K3
Amenda Bola M  103_Beautiful_View M1tK6G
Amy Cehn    F  11_detro_st Q1F1Y1
;
Run;
