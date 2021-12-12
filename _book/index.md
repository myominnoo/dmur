--- 
title: "Data Management Using R"
author: "Myo Minn Oo, MD, PhD"
date: "Last updated on 2021-12-12"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
bibliography: [book.bib, packages.bib]
# url: your book url like https://bookdown.org/yihui/bookdown
# cover-image: path to the social sharing image like images/cover.jpg
description: This book is a guidebook for medical data management in R. 
# link-citations: yes
github-repo: myominnoo/dmur
# github-repo: rstudio/bookdown-demo
url: 'https\://dmur.netlify.com'
editor_options: 
  markdown: 
    wrap: sentence
---

# {-}

<meta name="description" content="This book is a guidebook for medical data management in R.">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

Welcome to `dmur`!

This is a book for anyone who are interested in manipulating and processing medical data. This book introduces different aspects of data management and how to implement these in R using RStudio. While there are a plethora of great R books covering a variety of data management topics, I hope this book would serve as a self-learning guide to avoid roadblocks and frustrations before becoming fully comfortable with using R. Many beginners find themselves wanting to develop data management skills in R, but lose their patience after they encounter a steep learning curve of R and several months of frustration. If you feel nostalgic about this, this book is for you. 

It is intended for non-technical audience and Stata users to: 

* Serve as a guidebook to R code for data management
* Serve as a R code reference manual for `mStats` package
* Provide task-centered examples addressing common data management problems
* Assist people in transitioning to R


<!-- ======================================================= -->
<form target="_blank" action="https://paypal.me/myominnoo" method="post" target="_top">
<input type="hidden" name="hosted_button_id" value="ZWAS7SEV7F8BJ" />
<input type="image" src="https://github.com/appliedepi/epiRhandbook_eng/raw/master/images/donate_button_long.png" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" />
</form>
<!-- ======================================================= -->


## Under construction {-}
This book is still **UNDER CONSTRUCTION**. If you have any comments or suggestions, feel free to contact me at [dr.myominnoo@gmail.com](mailto::dr.myominnoo@gmail.com). Thank you!

if you have a dataset that you think would be suitable for inclusion in this text (as an example or for an exercise), I would love to hear about it.

<form target="_blank" action="https://forms.gle/YeJPpRcSLUzeZE5u7">
    <input type="submit" value="SUGGESTIONS" />
</form>


## Inspirations {-}  

Tutorials and books that provided ideas and knowledge of this book are credited within their respective pages. More generally, the following sources provided inspiration for this book:  

* [Data Management Using Stata: A Practical Handbook](https://www.stata.com/bookstore/data-management-using-stata/)
* [UCLA's Stata tutorials](https://stats.idre.ucla.edu/stata/)
* [R for applied epidemiology and public health](https://www.epirhandbook.com/en/) 
* [R for Data Science book (R4DS)](https://r4ds.had.co.nz/)  
* [bookdown: Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/)
* [Netlify](https://www.netlify.com) hosts this website  

The design of this book is based on the codes obtained from [Peter Higgins](https://github.com/higgi13425/rmrwr-book). Kudos to Peter!

## How to use this handbook {-} 

* Browse the pages in the Table of Contents, or use the search box
* Click the "copy" icons to copy code  
* You can follow along with the example datasets we will download in the next chapter \@ref(exampledata).

## Software versions {-}

The knitr package (Xie 2015) and the bookdown package (Xie 2021) were used to compile this text. The R session information is shown below:


```r
xfun::session_info()
```

```
## R version 4.1.0 (2021-05-18)
## Platform: x86_64-apple-darwin17.0 (64-bit)
## Running under: macOS Big Sur 10.16
## 
## Locale: en_US.UTF-8 / en_US.UTF-8 / en_US.UTF-8 / C / en_US.UTF-8 / en_US.UTF-8
## 
## Package version:
##   base64enc_0.1.3 bookdown_0.24.4 compiler_4.1.0  digest_0.6.29  
##   evaluate_0.14   fastmap_1.1.0   glue_1.5.1      graphics_4.1.0 
##   grDevices_4.1.0 highr_0.9       htmltools_0.5.2 jquerylib_0.1.4
##   jsonlite_1.7.2  knitr_1.36      magrittr_2.0.1  methods_4.1.0  
##   rlang_0.4.12    rmarkdown_2.11  stats_4.1.0     stringi_1.7.6  
##   stringr_1.4.0   tinytex_0.35    tools_4.1.0     utils_4.1.0    
##   xfun_0.28       yaml_2.2.1
```

```r
packageVersion("tidyverse")
```

```
## [1] '1.3.1'
```

```r
packageVersion("dplyr")
```

```
## [1] '1.0.7'
```

```r
packageVersion("magrittr")
```

```
## [1] '2.0.1'
```

```r
packageVersion("mStats")
```

```
## [1] '4.0.0'
```

<!-- ### Image credits {-}   -->

<!-- Images in logo from US CDC Public Health Image Library) include [2013 Yemen looking for mosquito breeding sites](https://phil.cdc.gov/Details.aspx?pid=19623), [Ebola virus](https://phil.cdc.gov/Details.aspx?pid=23186), and [Survey in Rajasthan](https://phil.cdc.gov/Details.aspx?pid=19838).   -->


## Terms of Use and Contribution {-}  

### License {-} 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a> Data Management Using R, 2021 <br />This work is licensed by Applied Epi Incorporated under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.


Academic courses and training programs are welcome to use this handbook with their students, but please send us an email to let me know. If you have questions about your intended use, email **dr.myominnoo@gmail.com**.

### Citation {-}

Oo, Myo Minn. Data Management Using R. 2021.

### Contribution {.unnumbered}  

If you would like to make a content contribution, please contact with us first via Github issues or by email. We are implementing a schedule for updates and are creating a contributor guide.  

Please note that the epiRhandbook project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
