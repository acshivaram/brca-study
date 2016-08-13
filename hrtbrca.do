cd "/Users/arindambose/GitHub/brca-study"

clear all

//  read the data file

insheet using breastca.csv, comma

save breastca, replace

use breastca

set more off

//list

// describe

//twoway (scatter declinehrtuse cadecrease) (qfit declinehrtuse cadecrease)

//summarize cadecrease declinehrtuse

/*
drop if cadecrease < 0

save breastca2, replace

use breastca2


summarize cadecrease declinehrtuse

twoway (scatter cadecrease declinehrtuse  ) (qfit cadecrease declinehrtuse )

gen declinehrtuse2 = declinehrtuse^2

regress cadecrease declinehrtuse declinehrtuse2


tab cadecrease


tab cadeccat2

median declinehrtuse, by(cadeccat2) 
*/

describe
sum declinehrtuse cadecrease peakhrtusepct
// generate three level variable to categorise decrease in ca incidence
// 1 = increase, 0/3.7 = no to some decrease, 3.8 - highest = most decrease
 
recode cadecrease (-14/-0.5 = 1) (0/3.7 = 2) (3.8/21.8 = 3), gen(deccat)

// Or, we can make it binary, i.e., that is those who showed either 
// increase or no change versus those who actually decreased

recode cadecrease (-14/0 = 1) (else = 2), gen(decabin)

tab decabin

tab deccat

// what is the average decline in hrt use in each of these groups?

mean declinehrtuse, over(decabin)


