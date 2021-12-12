# Using existing data files

You have some data that you are eager to analyze using R. Before you can analyze the data, you must first read the data into R. This chapter describes how you can read common types of data files into R. 

## Working directories 

I would recommend against using absolute pathway with the `setwd()` function for your works. One main reason is that other people don't have the same pathways as yours, and it makes replicating codes in other people's devices extremely cumbersome. There are two ways I find more efficient and productive than just setting up your directory with `setwd()`. 

1. Open RStudio by doublie-clicking the `.R` file. 
2. Create an R project and open RStudio by double-clicking the `.Rproj` file. 

Both methods will automatically set up your working directory to the folder where your `.R` or `.Rproj` file exists. Then you use relative pathway to navigate to other folders and files. 

If you have followed the section on downloading `dmus2` datasets, you might already have a `data` folder. You can put this data folder under your project folder, whatever you may call it. For the sake of demonstration, let's create a folder named `dmur` and put this `data` folder under `dmur`. You can start create necessary `.R` and `.Rproj` files as follows. Essentially, you will have the following structures under the`dmur` folder. 


```r
- dmur              ## this is your project or root folder
    |
    - data          ## this is data folder that contains `dmus2` datasets.
        |
        - many datasets ...     ## these are `dmus2` datasets

    |
    - dmur.R  ## You can double-click this to open RStudio 
    |
    - dmur.Rproj  ## You can also double-click this to open RStudio
```

[To add how to create .R or .Rproj files]

## Reading data files into R

There are several data files that you can read and import into R. This chapter begins by illustrating how you can read several common types of datasets into R. As you would expect, you can certainly do this in multiple ways; however I will show the ways I think simplest and most efficient. 

In previous section \@ref(exampledata), we have downloaded several datasets into respective folders under a `data` folder of your current working directory. It should look like the following structure. 


```r
- Your current working directory
    |
    _ data
        |
        _ dmus2     ## <<== This is where dmus2 datasets were downloaded ==>> 
        |
        _ who       ## <<== This is where who datasets were downloaded ==>>
```

When we specify a path later, we will use this folder structure. If we want to import a dataset from `dmus2` folder, we will specify the file in this format `./data/dmus2/filename`.

### CSV and text data files

Comma-separated values files, also known as `CSV` files, are a common format for storing raw data. They have a filename extension of `.csv`. As the name suggests, `CSV` files use `commas` to separate the variables (columns) of the data. Data files in `CSV` format often include the names of the variables in the first row, also separated by commas. 

We illustrate this below by using a `momkid1.csv` data file, which includes identification number of mom, month, day and year of mom's birthday, and kid's birthday.

While there are several ways to import a raw data file, we use `read_csv()` function from the `readr` package. As we use this function probably once at this time when we import datasets, we write `readr::read_csv()` to indicate the function from `readr` package without loading the whole package. We will use this pattern in the whole book whenever we need one particular function from a package at one time. 



```r
momkid1 <- readr::read_csv("data/dmus2/momkid1.csv")
```

```
## Rows: 4 Columns: 5
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (1): kidbday
## dbl (4): momid, momm, momd, momy
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
momkid1
```

```
## # A tibble: 4 × 5
##   momid  momm  momd  momy kidbday  
##   <dbl> <dbl> <dbl> <dbl> <chr>    
## 1     1    11    28  1972 1/5/1998 
## 2     2     4     3  1973 4/11/2002
## 3     3     6    13  1968 5/15/1996
## 4     4     1     5  1960 1/4/2004
```

The imported dataset can be displayed in the console just by typing in the assigned object name `momkid1`. 

Text files are also quite popular in storing simple raw data. In the example below, the `dentists1.txt` data file contains five rows of data regarding five dentists. The four variables reflect the name of the dentist, the years she or he has been practicing, whether she or he works full time, and whether she or he recommends Quaddent gum. 


```r
dentists1 <- readr::read_csv("data/dmus2/dentists1.txt")
```

```
## Rows: 5 Columns: 4
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (1): name
## dbl (3): years, fulltime, recom
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
dentists1
```

```
## # A tibble: 5 × 4
##   name              years fulltime recom
##   <chr>             <dbl>    <dbl> <dbl>
## 1 Y. Don Uflossmore  7.25        0     1
## 2 Olive Tu'Drill    10.2         1     1
## 3 Isaac O'Yerbreath 32.8         1     1
## 4 Ruth Canaale      22           1     1
## 5 Mike Avity         8.5         0     0
```

See `?read_csv` for more details on their optional arguments. 

#### Exercises

We have downloaded a few mortality datasets from WHO. Try to import the following datasets without looking at the answer: 

* `pop` which contains reference population* and live birth data.
* `country_codes` which contains country codes

#### Solutions

As you might realize, there is no file extension for these files. Try opening these files with a text editor. You will see that these files are stored in comma-separated format. Hence, we will read using `readr::read_csv()`


```r
pop <- readr::read_csv("data/who/pop")
```

```
## Rows: 9719 Columns: 33
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): SubDiv, Frmat
## dbl (31): Country, Admin1, Year, Sex, Pop1, Pop2, Pop3, Pop4, Pop5, Pop6, Po...
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
pop
```

```
## # A tibble: 9,719 × 33
##    Country Admin1 SubDiv  Year   Sex Frmat    Pop1   Pop2   Pop3  Pop4  Pop5
##      <dbl>  <dbl> <chr>  <dbl> <dbl> <chr>   <dbl>  <dbl>  <dbl> <dbl> <dbl>
##  1    1060     NA <NA>    1980     1 07     137100   3400  15800    NA    NA
##  2    1060     NA <NA>    1980     2 07     159000   4000  18400    NA    NA
##  3    1125     NA <NA>    1955     1 02    5051500 150300 543400    NA    NA
##  4    1125     NA <NA>    1955     2 02    5049400 145200 551000    NA    NA
##  5    1125     NA <NA>    1956     1 02    5353700 158700 576600    NA    NA
##  6    1125     NA <NA>    1956     2 02    5351400 153600 584800    NA    NA
##  7    1125     NA <NA>    1957     1 02    5403000 160300 580800    NA    NA
##  8    1125     NA <NA>    1957     2 02    5392000 155300 589400    NA    NA
##  9    1125     NA <NA>    1958     1 02    5506900 162800 592000    NA    NA
## 10    1125     NA <NA>    1958     2 02    5494400 157800 600100    NA    NA
## # … with 9,709 more rows, and 22 more variables: Pop6 <dbl>, Pop7 <dbl>,
## #   Pop8 <dbl>, Pop9 <dbl>, Pop10 <dbl>, Pop11 <dbl>, Pop12 <dbl>, Pop13 <dbl>,
## #   Pop14 <dbl>, Pop15 <dbl>, Pop16 <dbl>, Pop17 <dbl>, Pop18 <dbl>,
## #   Pop19 <dbl>, Pop20 <dbl>, Pop21 <dbl>, Pop22 <dbl>, Pop23 <dbl>,
## #   Pop24 <dbl>, Pop25 <dbl>, Pop26 <dbl>, Lb <dbl>
```

```r
country_codes <- readr::read_csv("data/who/country_codes")
```

```
## Rows: 227 Columns: 2
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (1): name
## dbl (1): country
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
country_codes
```

```
## # A tibble: 227 × 2
##    country name                    
##      <dbl> <chr>                   
##  1    1010 Algeria                 
##  2    1020 Angola                  
##  3    1025 Benin                   
##  4    1030 Botswana                
##  5    1035 Burkina Faso            
##  6    1040 Burundi                 
##  7    1045 Cameroon                
##  8    1060 Cape Verde              
##  9    1070 Central African Republic
## 10    1080 Chad                    
## # … with 217 more rows
```

### Excel spreadsheets 

You frequently receive data files stored as Excel spreadsheets. For example, the spreadsheet file named `dentists.xls` contains information about five dentists. You can import Excel spreadsheets into R by using `read_excel()` from the `readxl` package. 


```r
dentists <- readxl::read_excel("data/dmus2/dentists.xls")
dentists
```

```
## # A tibble: 5 × 4
##   name              years fulltime recom
##   <chr>             <dbl>    <dbl> <dbl>
## 1 Y. Don Uflossmore  7.25        0     1
## 2 Olive Tu'Drill    10.2         1     1
## 3 Isaac O'Yerbreath 32.8         1     1
## 4 Ruth Canaale      22           1     1
## 5 Mike Avity         8.5         0     0
```

As we did with `dentists.xls`, let’s import another file named `dentists2.xls` using the `read_excel()` function.


```r
dentists2 <- readxl::read_excel("data/dmus2/dentists2.xls")
dentists2
```

```
## # A tibble: 4 × 2
##   name       years
##   <chr>      <dbl>
## 1 I. Sue Yoo     3
## 2 A. Dewey       8
## 3 B. Cheetem    11
## 4 C. Howe       21
```

Only 2 variables and 4 observations were imported. These are the names of lawyers. If you open the file with Excel or a spreadsheet program, you will realize that there are three sheets in the file, namely `lawyers`, `dentists`, and `Sheet2`. When there are multiple sheets in an Excel file, the default behavior for the `read_excel()` function is to import the first sheet. As such, the results from the list command above is showing a listing of lawyers because the first sheet contained information about lawyers.

We can import the contents of the sheet named `dentists` by adding the optional argument `sheet = "dentists"`, as illustrated below. This tells the function that it should specifically import the sheet named `dentists`.


```r
dentists2 <- readxl::read_excel("data/dmus2/dentists2.xls", sheet = "dentists")
dentists2
```

```
## # A tibble: 5 × 4
##   name              years fulltime recom
##   <chr>             <dbl>    <dbl> <dbl>
## 1 Y. Don Uflossmore  7.25        0     1
## 2 Olive Tu'Drill    10.2         1     1
## 3 Isaac O'Yerbreath 32.8         1     1
## 4 Ruth Canaale      22           1     1
## 5 Mike Avity         8.5         0     0
```

As we would expect, the imported dataset has 4 variables and 5 observations which matches the contents of the `dentists` sheet.

Another file named `dentist3.xls` has additional information stored along with the data. In particular, column E contains notes about the dentists, and the last row, row 7, contains column totals for some of the variables. Let's try to import this excel file using `read_excel()`. 


```r
dentists3 <- readxl::read_excel("data/dmus2/dentists3.xls")
```

```
## New names:
## * `` -> ...5
```

```r
dentists3
```

```
## # A tibble: 6 × 5
##   name              years fulltime recom ...5                    
##   <chr>             <dbl>    <dbl> <dbl> <chr>                   
## 1 Y. Don Uflossmore  7.25        0     1 <NA>                    
## 2 Olive Tu'Drill    10.2         1     1 Good with children      
## 3 Isaac O'Yerbreath 32.8         1     1 <NA>                    
## 4 Ruth Canaale      22           1     1 <NA>                    
## 5 Mike Avity         8.5         0     0 Has evening appointments
## 6 Total             80.8         3     4 <NA>
```

As you can see, the function imported all 5 variables and 6 observations including the `Total` row. We are only interested in the first four columns and five rows. Let's include the `range` optional argument. In Excel's terms, we want the data from cell `A1` to cell `D6`. The codes below illustrate how to import a specified cell range into R.   


```r
dentists3 <- readxl::read_excel("data/dmus2/dentists3.xls", range = "A1:D6")
dentists3
```

```
## # A tibble: 5 × 4
##   name              years fulltime recom
##   <chr>             <dbl>    <dbl> <dbl>
## 1 Y. Don Uflossmore  7.25        0     1
## 2 Olive Tu'Drill    10.2         1     1
## 3 Isaac O'Yerbreath 32.8         1     1
## 4 Ruth Canaale      22           1     1
## 5 Mike Avity         8.5         0     0
```

The console output now indicates that we have successfully imported the 4 variables and 5 observations we wanted.

See `?read_excel` for more details on their optional arguments. 

#### Exercises

Import the following excel spreadsheets: 

* `list_ctry_yrs_21June2021.xlsx` in `who` folder that contains A list of countries-years available for the mortality and population data. 
* `miliary_tb.xlsx` in `others` folder that contains information about patients with miliary tuberculosis.

#### Solutions

Let's import `list_ctry_yrs_21June2021.xlsx` using `readxl::read_excel()`. 


```r
list_ctry_yrs <- readxl::read_excel("data/who/list_ctry_yrs_21June2021.xlsx")
```

```
## New names:
## * `` -> ...2
## * `` -> ...3
## * `` -> ...4
## * `` -> ...5
## * `` -> ...6
## * ...
```

```r
list_ctry_yrs
```

```
## # A tibble: 5,919 × 8
##    `World Health Organization Mortal… ...2   ...3  ...4  ...5  ...6  ...7  ...8 
##    <chr>                              <chr>  <chr> <chr> <chr> <chr> <chr> <chr>
##  1 "Availability of countries-years … <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  2 "In  column \"ICD\",  \"Icd7\" da… <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  3 "Consult file  \"Documentation.do… <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  4 "Cells in orange  indicate the ad… <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  5 "If you wish to be alerted of the… <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  6  <NA>                              <NA>   <NA>  <NA>  <NA>  <NA>  <NA>  <NA> 
##  7 "Country"                          name   Admi… SubD… Year  List  Icd   Upda…
##  8 "4005"                             Alban… <NA>  <NA>  1987  09B   Icd9  <NA> 
##  9 "4005"                             Alban… <NA>  <NA>  1988  09B   Icd9  <NA> 
## 10 "4005"                             Alban… <NA>  <NA>  1989  09B   Icd9  <NA> 
## # … with 5,909 more rows
```
As you can see, this is not correct yet. Apparently, there are some texts in several rows above the data. If you open this file with a spreadsheet program and count them, you know there are exactly seven rows that we need to skip.

We specify another argument called `skip` in the function to illustrate this. 




```r
list_ctry_yrs <- readxl::read_excel("data/who/list_ctry_yrs_21June2021.xlsx", skip = 7)
```

```r
list_ctry_yrs
```

```
## # A tibble: 5,912 × 8
##    Country name    Admin1 SubDiv Year  List  Icd   Update
##    <chr>   <chr>   <chr>  <lgl>  <chr> <chr> <chr> <chr> 
##  1 4005    Albania <NA>   NA     1987  09B   Icd9  <NA>  
##  2 4005    Albania <NA>   NA     1988  09B   Icd9  <NA>  
##  3 4005    Albania <NA>   NA     1989  09B   Icd9  <NA>  
##  4 4005    Albania <NA>   NA     1992  09B   Icd9  <NA>  
##  5 4005    Albania <NA>   NA     1993  09B   Icd9  <NA>  
##  6 4005    Albania <NA>   NA     1994  09B   Icd9  <NA>  
##  7 4005    Albania <NA>   NA     1995  09B   Icd9  <NA>  
##  8 4005    Albania <NA>   NA     1996  09B   Icd9  <NA>  
##  9 4005    Albania <NA>   NA     1997  09B   Icd9  <NA>  
## 10 4005    Albania <NA>   NA     1998  09B   Icd9  <NA>  
## # … with 5,902 more rows
```

Similary, we can do this by specifying an exact range. 




```r
list_ctry_yrs <- readxl::read_excel("data/who/list_ctry_yrs_21June2021.xlsx", 
                                    range = "A8:H5920")
```

```r
list_ctry_yrs
```

```
## # A tibble: 5,912 × 8
##    Country name    Admin1 SubDiv Year  List  Icd   Update
##    <chr>   <chr>   <chr>  <lgl>  <chr> <chr> <chr> <chr> 
##  1 4005    Albania <NA>   NA     1987  09B   Icd9  <NA>  
##  2 4005    Albania <NA>   NA     1988  09B   Icd9  <NA>  
##  3 4005    Albania <NA>   NA     1989  09B   Icd9  <NA>  
##  4 4005    Albania <NA>   NA     1992  09B   Icd9  <NA>  
##  5 4005    Albania <NA>   NA     1993  09B   Icd9  <NA>  
##  6 4005    Albania <NA>   NA     1994  09B   Icd9  <NA>  
##  7 4005    Albania <NA>   NA     1995  09B   Icd9  <NA>  
##  8 4005    Albania <NA>   NA     1996  09B   Icd9  <NA>  
##  9 4005    Albania <NA>   NA     1997  09B   Icd9  <NA>  
## 10 4005    Albania <NA>   NA     1998  09B   Icd9  <NA>  
## # … with 5,902 more rows
```

For the miliary tuberculosis, it's straightforward to import this dataset. 


```r
miliary_tb <- readxl::read_excel("./data/others/miliary_tb.xlsx")
miliary_tb
```

```
## # A tibble: 81 × 34
##      age gender diagnosis duration cough sputum fiver nightsweat fatigue
##    <dbl>  <dbl>     <dbl>    <dbl> <dbl>  <dbl> <dbl>      <dbl>   <dbl>
##  1     4      2         1       10     1      0     0          0       0
##  2    43      1         1       60     1      1     1          1       0
##  3    20      2         1       45     0      0     1          0       0
##  4    22      2         1       30     0      0     1          0       0
##  5    67      1         1       40     1      0     1          0       0
##  6     6      1         1       13     0      0     1          0       0
##  7    21      2         1       14     1      1     1          0       0
##  8    22      1         1       13     0      0     1          0       0
##  9    30      1         1      120     1      1     1          0       0
## 10    36      1         1        3     1      1     1          0       0
## # … with 71 more rows, and 25 more variables: emaciation <dbl>, nausea <dbl>,
## #   vomit <dbl>, chestpain <dbl>, shortbreath <dbl>, headache <dbl>, WBC <dbl>,
## #   RBC <dbl>, HGB <dbl>, PLT <dbl>, Perc Neutr <dbl>, ALT <dbl>, AST <dbl>,
## #   TP <dbl>, ALB <dbl>, GLB <dbl>, TBIL <dbl>, DBIL <dbl>, IBIL <dbl>,
## #   GGT <dbl>, BUN <dbl>, CREA <dbl>, ESR <dbl>, CRP <dbl>, ADA <dbl>
```


### Stata datasets 

Let's read the same dataset `dentists` using Stata `.dta` format. We use the `read_dta()` function from the `haven` package. 


```r
dentists <- haven::read_dta("data/dmus2/dentists.dta")
dentists
```

```
## # A tibble: 5 × 4
##   name              years fulltime recom
##   <chr>             <dbl>    <dbl> <dbl>
## 1 Y. Don Uflossmore  7.25        0     1
## 2 Olive Tu'Drill    10.2         1     1
## 3 Isaac O'Yerbreath 32.8         1     1
## 4 Ruth Canaale      22           1     1
## 5 Mike Avity         8.5         0     0
```

As you can see, we successfully read this dataset. The console output shows the information from the five dentists: their names, the years they have been practicing, whether they work full time, and whether they recommend Quaddent gum. 

In addition to reading datasets from your computer, you can also read datasets stored on remote web servers. For example, `dentists.dta` is located on the Stata Press website, and you can use it by specifying its web URL address, as follows. 


```r
dentists <- haven::read_dta("https://www.stata-press.com/data/dmus2/dentists.dta")
```

Often our dataset might be enormous. Let's pretend that `dentists.dta` contains many variables, and we are only interested in importing just the variables `name` and `years`. We can import just these variables from `dentists.dta`, as shown below.


```r
dentists <- haven::read_dta("data/dmus2/dentists.dta", 
                            col_select = c("name", "years"))
dentists
```

```
## # A tibble: 5 × 2
##   name              years
##   <chr>             <dbl>
## 1 Y. Don Uflossmore  7.25
## 2 Olive Tu'Drill    10.2 
## 3 Isaac O'Yerbreath 32.8 
## 4 Ruth Canaale      22   
## 5 Mike Avity         8.5
```

#### Exercises

Import all the Stata datasets under `ucla` folder. Check the folder using `dir()`.

#### Solutions


```r
## list ulca folder
dir("data/ucla/")
```

```
## [1] "doctor_stata_dm.dta"      "hsb2.csv"                
## [3] "hsb2.dta"                 "hsb2.xls"                
## [5] "patient_pt1_stata_dm.dta" "patient_pt2_stata_dm.dta"
```

```r
doctor_stata_dm <- haven::read_dta("data/ucla/doctor_stata_dm.dta")
doctor_stata_dm
```

```
## # A tibble: 40 × 5
##    docid experience school  lawsuits medicaid
##    <chr>      <dbl> <chr>      <dbl>    <dbl>
##  1 1-1           25 average        3    0.606
##  2 1-11          10 top            0    0.605
##  3 1-21          21 average        3    0.483
##  4 1-22          22 top            3    0.483
##  5 1-33          16 top            0    0.584
##  6 1-48          23 average        3    0.219
##  7 1-57          21 average        1    0.405
##  8 1-58          21 average        1    0.405
##  9 1-72          24 average        4    0.522
## 10 1-73          14 average        1    0.522
## # … with 30 more rows
```

```r
patient_pt1_stata_dm <- haven::read_dta("data/ucla/patient_pt1_stata_dm.dta")
patient_pt1_stata_dm
```

```
## # A tibble: 120 × 25
##    hospital hospid docid dis_date   tumorsize   co2  pain wound mobility ntumors
##    <chr>     <dbl> <chr> <date>         <dbl> <dbl> <dbl> <dbl>    <dbl>   <dbl>
##  1 UCLA          1 1-1   2009-09-06      68.0  1.53     4     4        2       0
##  2 UCLA          1 1-1   2011-01-07      64.7  1.68     2     3        2       0
##  3 UCLA          1 1-1   2010-09-04      86.4  1.45     3     3        2       0
##  4 UCLA          1 1-1   2010-06-25      53.4  1.57     3     4        2       0
##  5 UCLA          1 1-1   2009-07-01      51.7  1.42     4     5        2       0
##  6 UCLA          1 1-1   2009-03-06      78.9  1.71     3     4        2       0
##  7 UCLA          1 1-1   2010-04-15      62.9  1.54     4     4        3       2
##  8 UCLA          1 1-11  2010-07-25      73.2  1.45     4     5        9       9
##  9 UCLA          1 1-11  2009-07-12      81.2  1.55     5     5        9       0
## 10 UCLA          1 1-11  2009-08-19      61.3  1.49     7     7        8       2
## # … with 110 more rows, and 15 more variables: nmorphine <dbl>,
## #   remission <dbl>, lungcapacity <dbl>, age <dbl>, married <dbl>,
## #   familyhx <chr>, smokinghx <chr>, sex <chr>, cancerstage <chr>,
## #   lengthofstay <dbl>, wbc <chr>, rbc <dbl>, bmi <dbl>, test1 <dbl>,
## #   test2 <dbl>
```

```r
patient_pt2_stata_dm <- haven::read_dta("data/ucla/patient_pt2_stata_dm.dta")
patient_pt2_stata_dm
```

```
## # A tibble: 111 × 24
##    hospital        hospid docid dis_date   tumorsize    co2  pain wound mobility
##    <chr>            <dbl> <chr> <date>         <dbl>  <dbl> <dbl> <dbl>    <dbl>
##  1 "Cedars-Sinai"       3 3-227 2009-10-01      69.8   1.53     6     5        5
##  2 "Cedars-Sinai"       3 3-227 2010-02-18      68.0   1.69     8     4        5
##  3 "Cedars-Sinai"       3 3-227 2009-06-30      65.1   1.56     7     4        6
##  4 "Cedars-Sinai"       3 3-227 2009-11-15      71.4 -98        9     5        6
##  5 "Cedars-Sinai"       3 3-227 2010-02-17      69.5   1.68     4     5        6
##  6 "Cedars-Sinai"       3 3-227 2009-12-22      89.7   1.89     5     6        5
##  7 " Cedars-Sinai"      3 3-227 2010-04-15      73.1   1.78     6     4        5
##  8 "Cedars-Sinai"       3 3-241 2010-04-17      80.6   1.53     3     7        6
##  9 "Cedars-Sinai"       3 3-241 2010-10-12      55.1   1.71     5     7        6
## 10 "Cedars-Sinai"       3 3-241 2009-10-30      61.3   1.78     8     7        6
## # … with 101 more rows, and 15 more variables: ntumors <dbl>, remission <dbl>,
## #   lungcapacity <dbl>, age <dbl>, married <dbl>, familyhx <chr>,
## #   smokinghx <chr>, sex <chr>, cancerstage <chr>, lengthofstay <dbl>,
## #   wbc <chr>, rbc <dbl>, bmi <dbl>, test1 <dbl>, test2 <dbl>
```

### SPSS datasets

The `read_spss()` function from the `haven` package can import IBM SPSS Statistics `.sav` files. The examples below illustrate this by using an IBM SPSS Statistics file named `dentlab.sav`. 


```r
dentlab <- haven::read_spss("./data/dmus2/dentlab.sav")
dentlab
```

```
## # A tibble: 5 × 4
##   name              years      fulltime                recom
##   <chr>             <dbl>     <dbl+lbl>            <dbl+lbl>
## 1 Y. Don Uflossmore  7.25 0 [part time] 1 [recommend]       
## 2 Olive Tu'Drill    10.2  1 [full time] 1 [recommend]       
## 3 Isaac O'Yerbreath 32.8  1 [full time] 1 [recommend]       
## 4 Ruth Canaale      22    1 [full time] 1 [recommend]       
## 5 Mike Avity         8.5  0 [part time] 0 [do not recommend]
```

See `?labelled_spss` for how labelled variables in SPSS are handled by the `haven` package in R.

Similar to `read_dta()`, we can import just the variables `name` and `years` from `dentlab.sav`, as shown below.


```r
dentlab <- haven::read_spss("data/dmus2/dentlab.sav", 
                            col_select = c("name", "years"))
dentlab
```

```
## # A tibble: 5 × 2
##   name              years
##   <chr>             <dbl>
## 1 Y. Don Uflossmore  7.25
## 2 Olive Tu'Drill    10.2 
## 3 Isaac O'Yerbreath 32.8 
## 4 Ruth Canaale      22   
## 5 Mike Avity         8.5
```

Another function `read_sav()` can read both `.sav` and `.zsav` files from IBM SPSS. See `?read_spss` or `?read_sav` for more details on their optional arguments. 

#### Exercises

[To add SPSS import exercises!]

### Entering data directly

In R, you can construct a datasets using `as.data.frame()` or `data.frame()`. In any case, we can put small column blocks together to form a dataset as shown below.


```r
name <- c("John Doe", "John Smith", "James Bond", "Jason Borne")
age <- runif(4, min = 35, max = 50) # this uses random prob distribution to generate age
ex_data <- data.frame(name, age)
ex_data
```

```
##          name      age
## 1    John Doe 46.13416
## 2  John Smith 39.54227
## 3  James Bond 48.98410
## 4 Jason Borne 37.17093
```

## Saving data files 

### R Data files



### CSV spreadsheets

### Excel spreadsheets 

### Stata datasets 

### SPSS datasets

### Other types 

delimited types
entering data directly

