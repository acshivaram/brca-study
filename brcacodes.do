clear all

cd "/Users/arindambose/Documents/ann-brca-paper/annetal/R-codes"

// read thee csv file

//insheet using "BrCaData.csv", comma

//save brcadata, replace

use brcadatanew2

set more off
//summarize
//describe
//turn off more

// data analysis from 15/10

recode CorrHRT (2.5/9.0 = 1 "Low Use") (9.0/46.0 = 2 "High Use"), gen(corrhrt3)

recode hrtusenext (6.9/9.7 = 1 "Low Use") ///
				(9.8/11.4 = 2 "Medium Use") ///
				(11.5/36 = 3 "High Use"), gen(hrtuserec)



log using brcapaper2.md, replace text

tab programtype1
tab YrClosestto2008
summarize CorrHRT brcaincidence2008 brcamortality2008
tab corrhrt3
tabstat brcaincidence2008 brcamortality, by(corrhrt3) statistics(mean sd)
kwallis brcaincidence2008, by(corrhrt3)
kwallis brcamortality2008, by(corrhrt3)
graph bar brcamortality2008, over(corrhrt3)

tabstat brcaincidence2008, by(hrtuserec) statistics(mean sd)
kwallis brcaincidence2008, by(hrtuserec)


log close



/*
// convert participation rate into numbers
destring participationrate, gen(partrate2)
// you use encode if you want to convert names to numbers
// like Arin, Mou, Maurine to 1, 2, 3 etc
gen float partrate3 = 100 * partrate2
set more off

tab1  programtype1 yearprogrambe~n year100pct detection~neuse 
summarize partrate3

rename detection~neuse detuse

recode partrate3 (19/63 = 1 "low rate") (64/87 = 2 "high rate"), gen(partratebin)

// recode peak hrt use and hrt use from the files

recode hrtusepeak (11/19 = 1 "Low Use") ///
				(20/30 = 2 "Medium Use") ///
				(30/46 = 3 "High Use"), gen(peakuserec)	
				
				
recode brcaincidence2008 (20/60.5 = 0 "low incidence") ///
						(60.5/99.7 = 1 "high incidence") ///
						, gen(brcaincbin3)
						
						
//twoway scatter brcaincidence2008 hrtusenext	

//graph bar brcaincidence2008, over(hrtuserec)			
				
//recast int peakuserec

//log using bracapaper.md, text replace

	
/*bysort peakuserec: summarize(brcaincidence2008)	
bysort peakuserec: summarize(brcamortality2008)
bysort hrtuserec: summarize(brcaincidence2008)
bysort hrtuserec: summarize(brcamortality2008)
*/
//kruskal wallis tests
//kwallis brcaincidence2008, by(peakuserec)
//kwallis brcamortality2008, by(peakuserec)
//kwallis brcaincidence2008, by(hrtuserec)
//kwallis brcamortality2008, by(hrtuserec)

//tab detuse partratebin, row
/*
log close
*/
