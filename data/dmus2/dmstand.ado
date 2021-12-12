*! Created on  5 May 2020 at 14:38:31
program define dmstand
  syntax varlist  
  display "The macro varlist contains -`varlist'-"
  * Foreach loop (from above) that standardizes variables named in **varlist**
  foreach v of varlist `varlist' {
    quietly egen z`v' = std(`v')
    order z`v', after(`v')
    local lab : variable label `v'
    label variable z`v' "Z:`lab'"
  }
end
