*! Created on  5 May 2020 at 14:38:31
program define dmmaxlen, rclass
  syntax [varlist]
  local max = 0
  foreach v of varlist `varlist' {
    local len = length("`v'")
    if (`len' > `max') {
      local max = `len'
    }
  }
  return local maxlen = `max'
end
