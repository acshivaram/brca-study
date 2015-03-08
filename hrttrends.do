clear all
cd "/Users/arindambose/Documents/"
insheet using hrttrends.csv

save hrttrends, replace

set more off

list
summarize pctreduction changeparpct


//hist pctreduction

//generate changeparpct2 = (changeparpct/parpctbrcapeakhrtuse)*100

plot pctreduction changeparpct2


