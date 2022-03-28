set more off
set varabbrev off
clear all
macro drop _all
version 16

//To check current working directory     
cd 
//To create new working directory (where_I_wanna_keep_my_new_file)   
cd "E:\2 STATA\Arif vai Data"

//To save a new STATA(.dta) file **save "file_name.dta", replace

//To import Excel file	  **import excel "E:\MSinUS\MS IN USA 27.12.21.xlsx", sheet("Data") firstrow clear

//To import CSV file	**import delimited "D:\STATA\2 STATA Practices Master File\ReadData.csv", clear

//To import STATA(.dta) file	   
cd "E:\2 STATA\Arif vai Data"    
use "Arif_vai_SampleData.dta", clear
tabstat qs01 qs02a qs02b , by( q106 ) stat(mean sd n)

//To Export Excel File	 **export excel using "E:\MSinUS\MS IN USA 26.3.22.xlsx", firstrow(variables), replace

//To Export CSV File    **export delimited using "D:\STATA\STATA Practices Master File\ReadData_update66.csv", replace

//To Export STATA(.dta) File	***cd "E:\2 STATA\Arif vai Data"   **save "Arif_vai_SampleData.dta", replace

//Explore data
*codebook
*summarize
*inspect 
*histogram var_name, freq
*describe var1 var2 
*count if price>5000
*count if price !=0
*isid var_name 

//Variable lavel setup **la var q2 "District"
//Value lavel setup **la de q2 1"Dhaka" 2"Rajshahi", replace  ***la val q2 q2

//To show any variable's descriptive statistics *(use any one of ta/tab)
ta qs02a 

//To show any variable's descriptive statistics with proportion  
numlabel, add 
ta qs02a   

//To keep a subset of variable  **keep var_name1 var_name2 var_name3 

//To keep a variables conditional value   **keep if var_name1>=100   ##(keep if values of var_name1 is greater or equal than 100)

//To remove any variable        ** drop var_name1

//How to sort variables in STATA *>>FOR Ascending order **gsort var_name   *>>FOR Descending order***gsort -var_name 

//How to Order variables in STATA *>>To make order 2 variables  **order family_size, after(Salary)  ##(Put family_size column after salary column)
				
//stata results in doc file 			
ssc install asdoc		
asdoc sum height weight, save (test1.doc)	
asdoc reg height weight, save (test1.doc)				
				price  mpg
//Graph combination 
Scatter price mpg, name(graph1, replace)
Scatter price mpg ||1fit price mpg, name(graph2, replace)
graph combine graph1 graph2
graph combine graph1 graph2, row(2)
hist price mpg, percent name(graph3, replace)
graph bar, over(weight) name(graph4, replace)
graph combine graph1 graph2 graph3 graph4 

///Count Frequency 
sum w1_r1 w1_r2 w1_r3 w1_r4 w1_r5 w1_r6 w1_r7 w1_r8 w1_r9 w1_r10 w1_r11 w1_r12 w1_r13 w1_r14 w1_r15 w1_r16 w1_r17 w1_r18 w1_r19 w1_r88 w1_99 w1_oth

///Freq of each activity based on Division 
ta w1_r1 qs02a
ta w1_r2 qs02a
ta w1_r3 qs02a
ta w1_r4 qs02a
ta w1_r5 qs02a
ta w1_r6 qs02a
ta w1_r7 qs02a
ta w1_r8 qs02a
ta w1_r9 qs02a
ta w1_r10 qs02a
ta w1_r11 qs02a
ta w1_r12 qs02a
ta w1_r13 qs02a
ta w1_r14 qs02a
ta w1_r15 qs02a
ta w1_r16 qs02a
ta w1_r17 qs02a
ta w1_r18 qs02a
ta w1_r19 qs02a
ta w1_r88 qs02a
ta w1_99 qs02a
ta w1_oth qs02a

///Freq of each activity based on Gender 
ta w1_r1 qs01  
ta w1_r2 qs01
ta w1_r3 qs01
ta w1_r4 qs01
ta w1_r5 qs01
ta w1_r6 qs01
ta w1_r7 qs01
ta w1_r8 qs01
ta w1_r9 qs01
ta w1_r10 qs01
ta w1_r11 qs01
ta w1_r12 qs01
ta w1_r13 qs01
ta w1_r14 qs01
ta w1_r15 qs01
ta w1_r16 qs01
ta w1_r17 qs01
ta w1_r18 qs01
ta w1_r19 qs01
ta w1_r88 qs01
ta w1_99 qs01
ta w1_oth qs01

tabulate qs01 qs02a, col
tabulate q106 qs02a, col
tabulate q106 qs01, col
asdoc tabulate d1 qs02a, col save(test2.doc)
asdoc tabulate d1 qs01, col save(test2.doc)
asdoc tabulate d1 qs01, col chi2 save(test2.doc)
asdoc rowwaise percentGE
asdoc tabulate d1 qs02a, row save(test2.doc)
asdoc tabulate d1 qs01, row save(test2.doc)
asdoc tabulate d1 qs01, row chi2 save(test2.doc)


sysuse auto, clear
fre foreign mpg
tabstat price weight mpg, by(foreign) stat(mean sd n)

    Setup
webuse citytemp2, clear

//    Two-way table of frequencies
tabulate region agecat

//    Include row percentages
tabulate region agecat, row

//    Include column percentages
tabulate region agecat, column

//    Include cell percentages
tabulate region agecat, cell

//    Include row percentages, suppress frequency counts
tabulate region agecat, row nofreq

//    Include chi-squared test for independence of rows and columns
tabulate region agecat, chi2



//////////////////////////////////////////////////////////////////////////////////
putdocx begin

// Add a title
putdocx paragraph, style(Title) 
putdocx text ("Blood pressure report")

putdocx textblock begin
We use data from the Second National Health and Nutrition Examination Survey
 to study the incidence of high blood pressure.
putdocx textblock end

// Add a heading
putdocx paragraph, style(Heading1)
putdocx text ("Logistic regression results")

putdocx textblock begin
We fit a logistic regression model of high blood pressure on
 weight, age group, and the interaction between age group and sex.
putdocx textblock end

// Add the coefficient table from the last estimation command
reg d1 qs02a
putdocx table tbl1 = etable, width(100%)
putdocx save report1, replace

///////////////////////////////////////////////////////////////////////////////











