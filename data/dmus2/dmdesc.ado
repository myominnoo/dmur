*! Created on  5 May 2020 at 14:38:31
program define dmdesc
  syntax [varlist]

  * Part 0. Compute length of longest variable
  dmmaxlen
  local maxlen = `r(maxlen)'
  local maxlen = max(`maxlen',7)  // At least 7 columns due to "Varname" 
  * Part 1. Compute Column Positions
  local col1 = 1
  local col2 = `col1' + `maxlen' + 1
  local col3 = `col2' + 10
  * Part 2. Display Column Headers
  display _col(`col1') "Varname" _col(`col2') "Obs" _col(`col3') "Varlab"
  * Part 3. Display each variable name, obs, and label
  foreach v of varlist `varlist' {
    local varlab : variable label `v'
    quietly count if !missing(`v')
    display _col(`col1') "`v'" _col(`col2') r(N) _col(`col3') `"`varlab'"' 
  }
end
