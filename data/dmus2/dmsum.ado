*! Created on  5 May 2020 at 14:38:31
program define dmsum
  syntax [varlist]
  *************************************************************************  
  * Part 0. Compute length of longest variable
  dmmaxlen
  local maxlen = `r(maxlen)'
  local maxlen = max(`maxlen',7)  // At least 7 columns due to "Varname" 
  *************************************************************************  
  * Part 1. Compute Column Positions
  local col1 = 1
  local col2 = `col1' + `maxlen' + 1
  local colwidth = 10              
  local col3 = `col2' + `colwidth' 
  local col4 = `col3' + `colwidth'
  local col5 = `col4' + `colwidth' 
  local col6 = `col5' + `colwidth' 
  local col7 = `col6' + `colwidth' 
  *************************************************************************  
  * Part 2. Display Column Headers
  display _col(`col1')      "Varname" _continue 
  display _col(`col2') %8s  "Obs"     _continue 
  display _col(`col3') %8s  "Mean"    _continue 
  display _col(`col4') %8s  "SD"      _continue 
  display _col(`col5') %8s  "Min"     _continue 
  display _col(`col6') %8s  "Max"     _continue 
  display _col(`col7') %8s  "Variable Label"    
  *************************************************************************  
  * Part 3. Display each variable name, summary stats, and label
  foreach v of varlist `varlist' {
    display _col(`col1') "`v'"             _continue   // Disp varname
    quietly count if !missing(`v')                     // Calc N
    display _col(`col2') %8.0g `r(N)'      _continue   // Disp N
    quietly summarize `v'                              // Calc sum stats
    display _col(`col3') %8.0g `r(mean)'   _continue   // Disp Mean
    display _col(`col4') %8.0g `r(sd)'     _continue   // Disp SD      
    display _col(`col5') %8.0g `r(min)'    _continue   // Disp Min      
    display _col(`col6') %8.0g `r(max)'    _continue   // Disp Max     
    local varlab : variable label `v'                  // Make VarLab 
    display _col(`col7')       "`varlab'"              // Disp Varlab  
  }
end 
