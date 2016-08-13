clear all
cd "/Users/arindambose/GitHub/brca-study"
//insheet using hrttrends.csv

//save hrttrends, replace

set more off

use hrttrends1

//list
//summarize pctreduction changeparpct


//hist pctreduction

//generate changeparpct2 = (changeparpct/parpctbrcapeakhrtuse)*100

//plot pctreduction changeparpct2

describe
tab peakhrtuse

// Data from Verkooijen Study
/*
clear

input str20 country redhrt redbrca
 US 68 10
 US 38 8.6
 US 34 5
 US 67 8.8
 US 73 13.9
 US 74 22.6
 US 79 18
 Germany 8 6.7
 Australia 40 6.7
 Belgium 41 9.5
 UK 64 0.8
 France 62 12.9
 end

save verkooijendata, replace
use verkooijendata
twoway (scatter redbrca redhrt) (lfit redbrca redhrt), ///
title("Breast Ca Incidence and HRT Use") ///
ytitle("Reduction in Breast Ca") ///
xtitle("Reduction in HRT Usage") 
regress redbrca redhrt
*/

// Extract data from the current database (our data)

clear 

input str20 country pctredhrt pctredbrca agescreen
Australia 43 6.7 2
Canada 70 8 1
Denmark 19 5.63 1
France 66 6.3 1
Italy 42 6.18 1
United States 33 6.7 2
Germany 50 8.8 1
Belgium 60 9.5 1
end

save ourdata, replace
use ourdata
twoway (scatter pctredbrca pctredhrt) (lfit pctredbrca pctredhrt), ///
title("Breast Ca Incidence and HRT Use") ///
ytitle("Reduction in Breast Ca") ///
xtitle("Reduction in HRT Usage") 
regress pctredbrca pctredhrt agescreen



//Analyses from Zbuk study

/*
clear 

input str20 country hrtred brcared
USA	22.5 6.7
Germany 20 8.8
Belgium 20 9.5
Canada 15 8
France 21 12
Switzerland 15 6
Australia 8 6.7
end

save zbukdata, replace

twoway (scatter brcared hrtred) (lfit brcared hrtred), ///
title("Breast Ca Incidence and HRT Use") ///
ytitle("Reduction in Breast Ca") ///
xtitle("Reduction in HRT Usage")

regress brcared hrtred
*/




