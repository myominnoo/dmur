*! Created on  5 May 2020 at 14:38:31
program define dmcheckunlab
  syntax varlist
  foreach v of varlist `varlist' {
    * Check current variable for value labels 
    local vallab : value label `v'
    if ("`vallab'" == "") {
      display "The variable `v' does not have value labels"
      continue
    }
    * Check each value of current variable for unlabeled values
    quietly levelsof `v', local(values) missing
    foreach x of local values {
      local lab : label (`v') `x', strict
      * display "The value `x' is labeled using -`lab'-"
      if ("`lab'" == "") {                             
        display "For the variable `v' the value label for `x' is empty."
      }
    }
  }
end
