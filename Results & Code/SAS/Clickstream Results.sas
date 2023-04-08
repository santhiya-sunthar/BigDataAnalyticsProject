proc import
out=clickstream
datafile ="C:\Users\santhiya.suntharesan\Downloads\e-shop clothing 2008.csv"
dbms=csv replace;
DELIMITER=';';
getnames=yes;
proc print data=clickstream(obs=10);
title "clickstream Dataset";
run;

ods graphics on;
proc hpsplit data=clickstream;
	class price_2 year month day order country session_ID page_1__main_category_ page_2__clothing_model_ colour location model_photography page;
	model price_2 = year month day order country session_ID page_1__main_category_ page_2__clothing_model_ colour location model_photography page;
	grow entropy; 
	prune costcomplexity;
run;
