
## search for data 
https://journals.plos.org/plosone/search?q=(supporting_information%3Axlsx)+AND%20title%3A%22tuberculosis%20%22&page=1
readr::read_csv("./data/dentists1.txt")



url <- "https://covid.ourworldindata.org/data/owid-covid-data.xlsx"
download.file(url, "data/covid.xlsx")
