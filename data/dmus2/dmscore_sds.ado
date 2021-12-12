*! Created on  5 May 2020 at 14:38:31
program define dmscore_sds
  syntax varlist(numeric min=5 max=5),  totvar(name max=1) catvar(name max=1)
   
  display "The macro varlist contains -`varlist'-"
  display "The macro totvar contains -`totvar'-"
  display "The macro catvar contains -`catvar'-"
  
  * Score the SDS here
  confirm new variable `totvar' `catvar'
  quietly egen `totvar'    = rowtotal(`varlist')
  quietly egen _miss       = rowmiss(`varlist')
  quietly replace `totvar' = .a if (_miss > 0)
  quietly recode `totvar' (0/10=1 "Min Dep") (10/15=2 "Mild Dep") ///
    (15/20=3 "Mod Dep") (20/25=4 "Sev Dep") (*=.a "Miss"), generate(`catvar')
  label variable `totvar' "SDS total score"
  label variable `catvar' "SDS Depression Category: using standard cutoffs"
end
