-------------------------------------------------------------------------------
      name:  <unnamed>
       log:  /Users/arindambose/Documents/ann-brca-paper/annetal/R-codes/brcapa
> per2.md
  log type:  text
 opened on:  16 Oct 2014, 00:26:31

. 
. tab programtype1

ProgramType |
          1 |      Freq.     Percent        Cum.
------------+-----------------------------------
          N |         11       44.00       44.00
         NS |          7       28.00       72.00
          O |          2        8.00       80.00
          S |          5       20.00      100.00
------------+-----------------------------------
      Total |         25      100.00

. tab YrClosestto2008

YrClosestto |
       2008 |      Freq.     Percent        Cum.
------------+-----------------------------------
       1992 |          1        4.00        4.00
       2000 |          2        8.00       12.00
       2001 |          1        4.00       16.00
       2002 |          4       16.00       32.00
       2003 |          4       16.00       48.00
       2004 |          1        4.00       52.00
       2005 |          2        8.00       60.00
       2006 |          2        8.00       68.00
       2007 |          3       12.00       80.00
    No Data |          5       20.00      100.00
------------+-----------------------------------
      Total |         25      100.00

. summarize CorrHRT brcaincidence2008 brcamortality2008

    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
     CorrHRT |        20       17.42    13.77513        2.5         46
brcainc~2008 |        23        75.1     20.7219       22.4       99.7
brcamor~2008 |        23    15.11304    3.565148        5.3       20.8

. tab corrhrt3

  RECODE of |
    CorrHRT |      Freq.     Percent        Cum.
------------+-----------------------------------
    Low Use |          6       30.00       30.00
   High Use |         14       70.00      100.00
------------+-----------------------------------
      Total |         20      100.00

. tabstat brcaincidence2008 brcamortality, by(corrhrt3) statistics(mean sd)

Summary statistics: mean, sd
  by categories of: corrhrt3 (RECODE of CorrHRT)

corrhrt3 |  brcain~8  brcamo~8
---------+--------------------
 Low Use |     74.46     15.42
         |  22.19894  4.808534
---------+--------------------
High Use |  79.55714        16
         |  20.33771  2.374869
---------+--------------------
   Total |  78.21579  15.84737
         |  20.33605  3.046376
------------------------------

. kwallis brcaincidence2008, by(corrhrt3)

Kruskal-Wallis equality-of-populations rank test

  +---------------------------+
  | corrhrt3 | Obs | Rank Sum |
  |----------+-----+----------|
  |  Low Use |   5 |    44.50 |
  | High Use |  14 |   145.50 |
  +---------------------------+

chi-squared =     0.259 with 1 d.f.
probability =     0.6106

chi-squared with ties =     0.260 with 1 d.f.
probability =     0.6103

. kwallis brcamortality2008, by(corrhrt3)

Kruskal-Wallis equality-of-populations rank test

  +---------------------------+
  | corrhrt3 | Obs | Rank Sum |
  |----------+-----+----------|
  |  Low Use |   5 |    48.00 |
  | High Use |  14 |   142.00 |
  +---------------------------+

chi-squared =     0.034 with 1 d.f.
probability =     0.8531

chi-squared with ties =     0.035 with 1 d.f.
probability =     0.8518

. graph bar brcamortality2008, over(corrhrt3)

. 
. tabstat brcaincidence2008, by(hrtuserec) statistics(mean sd)

Summary for variables: brcaincidence2008
     by categories of: hrtuserec (RECODE of hrtusenext (HRTUseNext))

 hrtuserec |      mean        sd
-----------+--------------------
   Low Use |      78.8   15.4787
Medium Use |    95.675   4.40104
  High Use |  83.53333  4.186487
        46 |      89.4         .
-----------+--------------------
     Total |  86.40714  9.610128
--------------------------------

. kwallis brcaincidence2008, by(hrtuserec)

Kruskal-Wallis equality-of-populations rank test

  +-----------------------------+
  |  hrtuserec | Obs | Rank Sum |
  |------------+-----+----------|
  |    Low Use |   3 |    16.00 |
  | Medium Use |   4 |    49.50 |
  |   High Use |   6 |    29.00 |
  |         46 |   1 |    10.50 |
  +-----------------------------+

chi-squared =     9.189 with 3 d.f.
probability =     0.0269

chi-squared with ties =     9.230 with 3 d.f.
probability =     0.0264

. 
. 
. log close
      name:  <unnamed>
       log:  /Users/arindambose/Documents/ann-brca-paper/annetal/R-codes/brcapa
> per2.md
  log type:  text
 closed on:  16 Oct 2014, 00:26:34
-------------------------------------------------------------------------------
