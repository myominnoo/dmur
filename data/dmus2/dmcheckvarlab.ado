*! Created on  5 May 2020 at 14:38:31
program define dmcheckvarlab 
  syntax [varlist]
  display "Checking the variables `varlist'"
  foreach v of varlist `varlist' {
    local varlab : variable label `v'
    if (`"`varlab'"' == "") {                   
      display "The variable label for variable `v' is empty!"
    }
  }  
end
