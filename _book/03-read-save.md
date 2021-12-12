# Using existing data files

You have some data that you are eager to analyze using R. Before you can analyze the data, you must first read the data into R. This chapter describes how you can read common types of data files into R. 

## Working directories 

I would recommend against using absolute pathway with the `setwd()` function for your works. One main reason is that other people don't have the same pathways as yours, and it makes replicating codes in other people's devices extremely cumbersome. We will discuss this point in later chapter as well. **To add chapter link later.** There are two ways I find more efficient and productive than just setting up your directory with `setwd()`. 

* Open RStudio by doublie-clicking the `.R` file. 
* Create an R project and open RStudio by double-clicking the `.Rproj` file. 

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

### Reading CSV and text data files

Comma-separated values files, also known as `CSV` files, are a common format for storing raw data. They have a filename extension of `.csv`. As the name suggests, `CSV` files use `commas` to separate the variables (columns) of the data. Data files in `CSV` format often include the names of the variables in the first row, also separated by commas. 

We illustrate this below by using a `momkid1.csv` data file, which includes identification number of mom, month, day and year of mom's birthday, and kid's birthday.

While there are several ways to import a raw data file, we use `read_csv()` function from the `readr` package. As we use this function probably once at this time when we import datasets, we write `readr::read_csv()` to indicate the function from `readr` package without loading the whole package. We will use this pattern in the whole book whenever we need one particular function from a package at one time. 



```r
momkid1 <- readr::read_csv("./data/momkid1.csv")
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
dentists1 <- readr::read_csv("./data/dentists1.txt")
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

### Reading Excel spreadsheets 

You frequently receive data files stored as Excel spreadsheets. For example, the spreadsheet file named `dentists.xls` contains information about five dentists. You can import Excel spreadsheets into R by using `read_excel()` from the `readxl` package. 


```r
dentists <- readxl::read_excel("./data/dentists.xls")
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
dentists2 <- readxl::read_excel("./data/dentists2.xls")
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
dentists2 <- readxl::read_excel("./data/dentists2.xls", sheet = "dentists")
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
dentists3 <- readxl::read_excel("./data/dentists3.xls")
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
dentists3 <- readxl::read_excel("./data/dentists3.xls", range = "A1:D6")
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

### Reading Stata datasets 

Let's read the same dataset `dentists` using Stata `.dta` format. We use the `read_dta()` function from the `haven` package. 


```r
dentists <- haven::read_dta("./data/dentists.dta")
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
dentists <- haven::read_dta("./data/dentists.dta", 
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

### Reading SPSS datasets

The `read_spss()` function from the `haven` package can import IBM SPSS Statistics `.sav` files. The examples below illustrate this by using an IBM SPSS Statistics file named `dentlab.sav`. 


```r
dentlab <- haven::read_spss("./data/dentlab.sav")
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
dentlab <- haven::read_spss("./data/dentlab.sav", 
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

### Reading other types 

delimited types
entering data directly

## Saving data files 

### Saving CSV spreadsheets

### Saving Excel spreadsheets 

### Saving Stata datasets 

### Saving SPSS datasets

### Saving other types 

delimited types
entering data directly

