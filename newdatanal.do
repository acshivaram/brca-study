version 12.1
clear all

cd "/Users/arindambose/Documents/ann-brca-paper/annetal/R-codes" 
input hrtred brcared
-14 2
-3 -5
-8 -6
-22 -11
end

generate float abshrtred = abs(hrtred)
generate float absbrcared = abs(brcared)

scatter absbrcared abshrtred

save brcared, replace

use brcared
