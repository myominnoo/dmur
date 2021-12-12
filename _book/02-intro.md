# Getting Started

`R` is an **free** software for statistics and graphics. It is widely used among statisicians and data scientists for developing statistical software and data analysis.     


`R` is primarily developed in three programming lanaguages: C, Fortan and R itself. Although It itself can be used with command line interface, there are several third-party intergrated development environment (IDE) with nice graphical user interface, including RStudio and Jupyter Notebook.    

`R` comes from `S programming language`. `S` was created by [John Chambers](https://en.wikipedia.org/wiki/John_Chambers_(programmer)) in 1976 at Bell Labs. Later two statisticians, Ross Ihaka and Robert Gentleman, developed R that is currently developed by the R Development Core Team. R is named partly after the first names of the first two R authors and partly as a play on the name of S.    


R can be downloaded from [http://cran.r-project.org/](http://cran.r-project.org/).   

## Downloading and installing R

## RStudio

download and install
start screen 
console right or left
workspace

## R Packages 


package masking
essential packages for the book 
tidyverse
mStats

## Workflows

piping 

## Searching Help

## Using this book

All chapter sections start with a second-level (`##`) or higher heading followed by your section title, like the sections above and below here. You can have as many as you want within a chapter.


## Disclaimer

First, this book is largely adapted from the book [Data Management Using Stata: A Practical Handbook, Second Edition](https://www.stata-press.com/data/dmus2.html). I tried to replicates examples and exercises as close to the book as possible. 

As Michael Mitchell recommended in his book, I also encourage you to type in the codes, see the results, and run the examples from this book for yourself. In this way, you will understand well how data management in R works. 

The following codes create a `data` folder in current working directory and download the datasets from the book `dmus2`. We will discuss how to set current working directory in a minimal and effective way in a later section. 


```r
## create a directory under current working folder
if (!dir.exists("data")) {
    dir.create("data")
}

## set the URL to dmus2 datasets in zipped format
dmus2 <- "https://www.stata-press.com/data/dmus2/dmus2.zip"

## create a temporary file to store the zipped file
temp <- tempfile()

## download the dmus2 zipped file into temporary file
download.file(dmus2, temp)

## extract the dmus2 datasets into the data folder
unzip(temp, exdir = "data/", junkpaths = TRUE)
```


More online resources and recommended books for R
