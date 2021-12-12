*! Created on  5 May 2020 at 14:38:31
program define dmcount
  syntax varlist

  preserve
  display "The level-2 identifier is `varlist'" 
  quietly count
  display "The number of observations is " r(N)
  bysort `varlist' : generate _first = (_n == 1)
  quietly count if (_first == 1)
  display "The number of level-2 observations is " r(N)
  restore
end
