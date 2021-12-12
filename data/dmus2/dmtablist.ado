*! Created on  5 May 2020 at 14:38:31
program define dmtablist
  version 16
  syntax varlist [if] [, sortfreq *]

  preserve
  generate _Fre = 1
  collapse (sum) _Fre `if', by(`varlist') 
  if "`sortfreq'" != "" { 
    gsort -_Fre
  }
  list `varlist' _Fre, `options'
  restore
end
