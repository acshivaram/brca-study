-------------------------------------------------------------------------------
      name:  <unnamed>
       log:  /Users/arindambose/Documents/ann-brca-paper/annetal/R-codes/bracap
> aper.md
  log type:  text
 opened on:  12 Oct 2014, 22:23:36

. 
. tabstat brcaincidence2008, by(hrtuserec) statistics(mean sd)

Summary for variables: brcaincidence2008
     by categories of: hrtuserec (RECODE of hrtusenext (HRTUseNext))

 hrtuserec |      mean        sd
-----------+--------------------
   Low Use |     74.35  15.45758
Medium Use |    95.675   4.40104
  High Use |  84.37143  4.418415
-----------+--------------------
     Total |  84.71333  11.34869
--------------------------------

.         
. /*bysort peakuserec: summarize(brcaincidence2008)       
> bysort peakuserec: summarize(brcamortality2008)
> bysort hrtuserec: summarize(brcaincidence2008)
> bysort hrtuserec: summarize(brcamortality2008)
> */
. //kruskal wallis tests
. //kwallis brcaincidence2008, by(peakuserec)
. //kwallis brcamortality2008, by(peakuserec)
. kwallis brcaincidence2008, by(hrtuserec)

Kruskal-Wallis equality-of-populations rank test

  +-----------------------------+
  |  hrtuserec | Obs | Rank Sum |
  |------------+-----+----------|
  |    Low Use |   4 |    20.00 |
  | Medium Use |   4 |    53.50 |
  |   High Use |   7 |    46.50 |
  +-----------------------------+

chi-squared =     8.223 with 2 d.f.
probability =     0.0164

chi-squared with ties =     8.267 with 2 d.f.
probability =     0.0160

. //kwallis brcamortality2008, by(hrtuserec)
. 
. //tab detuse partratebin, row
. 
. log close
      name:  <unnamed>
       log:  /Users/arindambose/Documents/ann-brca-paper/annetal/R-codes/bracap
> aper.md
  log type:  text
 closed on:  12 Oct 2014, 22:23:36
-------------------------------------------------------------------------------
