*! Created on  5 May 2020 at 14:38:31
program define dmcheckvallab 
  syntax [varlist]
  display "Checking the variables `varlist'"
  foreach v of varlist `varlist' {
    local lab : value label `v'  
    if ("`lab'" == "") {
        display "The value label for variable `v' is empty!"
    }
  }
end
