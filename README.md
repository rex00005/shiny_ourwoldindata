
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Shiny - Access to clean fuels for cooking vs. GDP per capita



## Xiaoyu Tian + 28540964

This file explains how you run the app for the assignment 2. You will need the following packages
installed to generate the gadget:

``` r
install.packages(c("shiny", "crosstalk", "plotly", "DT", "tidyverse", "here", "glue", "shinyWidgets"))
```

## How to run the app
After the installation of above packages, you can open the app.R which contains all the code for generating the shiny app.

On the top-left side of the app.R file, there is a `Run App` button. Simply press the `Run App`, and it will render automatically and generate the app.

## Session Info

-Session info ----------------------------------------------------------------------------------------------------------------------------------------
 setting  value                       
 version  R version 4.1.0 (2021-05-18)
 os       Windows 10 x64              
 system   x86_64, mingw32             
 ui       RStudio                     
 language (EN)                        
 collate  English_Australia.1252      
 ctype    English_Australia.1252      
 tz       Australia/Sydney            
 date     2021-09-25                  

-Packages --------------------------------------------------------------------------------------------------------------------------------------------
 package      * version date       lib source        
 assertthat     0.2.1   2019-03-21 [1] CRAN (R 4.1.0)
 backports      1.2.1   2020-12-09 [1] CRAN (R 4.1.0)
 bit            4.0.4   2020-08-04 [1] CRAN (R 4.1.0)
 bit64          4.0.5   2020-08-30 [1] CRAN (R 4.1.0)
 broom          0.7.9   2021-07-27 [1] CRAN (R 4.1.0)
 bslib          0.3.0   2021-09-02 [1] CRAN (R 4.1.1)
 cachem         1.0.6   2021-08-19 [1] CRAN (R 4.1.1)
 cellranger     1.1.0   2016-07-27 [1] CRAN (R 4.1.0)
 cli            3.0.1   2021-07-17 [1] CRAN (R 4.1.0)
 colorspace     2.0-2   2021-06-24 [1] CRAN (R 4.1.0)
 crayon         1.4.1   2021-02-08 [1] CRAN (R 4.1.0)
 crosstalk      1.1.1   2021-01-12 [1] CRAN (R 4.1.1)
 data.table     1.14.0  2021-02-21 [1] CRAN (R 4.1.0)
 DBI            1.1.1   2021-01-15 [1] CRAN (R 4.1.0)
 dbplyr         2.1.1   2021-04-06 [1] CRAN (R 4.1.0)
 digest         0.6.27  2020-10-24 [1] CRAN (R 4.1.0)
 dplyr        * 1.0.7   2021-06-18 [1] CRAN (R 4.1.0)
 DT           * 0.19    2021-09-02 [1] CRAN (R 4.1.1)
 ellipsis       0.3.2   2021-04-29 [1] CRAN (R 4.1.0)
 evaluate       0.14    2019-05-28 [1] CRAN (R 4.1.0)
 fansi          0.5.0   2021-05-25 [1] CRAN (R 4.1.0)
 farver         2.1.0   2021-02-28 [1] CRAN (R 4.1.0)
 fastmap        1.1.0   2021-01-25 [1] CRAN (R 4.1.0)
 fontawesome    0.2.2   2021-07-02 [1] CRAN (R 4.1.1)
 forcats      * 0.5.1   2021-01-27 [1] CRAN (R 4.1.0)
 fs             1.5.0   2020-07-31 [1] CRAN (R 4.1.0)
 generics       0.1.0   2020-10-31 [1] CRAN (R 4.1.0)
 ggplot2      * 3.3.5   2021-06-25 [1] CRAN (R 4.1.0)
 glue         * 1.4.2   2020-08-27 [1] CRAN (R 4.1.0)
 gtable         0.3.0   2019-03-25 [1] CRAN (R 4.1.0)
 haven          2.4.3   2021-08-04 [1] CRAN (R 4.1.1)
 here         * 1.0.1   2020-12-13 [1] CRAN (R 4.1.1)
 highr          0.9     2021-04-16 [1] CRAN (R 4.1.0)
 hms            1.1.0   2021-05-17 [1] CRAN (R 4.1.0)
 htmltools      0.5.2   2021-08-25 [1] CRAN (R 4.1.1)
 htmlwidgets    1.5.4   2021-09-08 [1] CRAN (R 4.1.1)
 httpuv         1.6.3   2021-09-09 [1] CRAN (R 4.1.1)
 httr           1.4.2   2020-07-20 [1] CRAN (R 4.1.0)
 janitor        2.1.0   2021-01-05 [1] CRAN (R 4.1.1)
 jquerylib      0.1.4   2021-04-26 [1] CRAN (R 4.1.0)
 jsonlite       1.7.2   2020-12-09 [1] CRAN (R 4.1.0)
 kableExtra     1.3.4   2021-02-20 [1] CRAN (R 4.1.0)
 knitr          1.34    2021-09-09 [1] CRAN (R 4.1.1)
 labeling       0.4.2   2020-10-20 [1] CRAN (R 4.1.0)
 later          1.3.0   2021-08-18 [1] CRAN (R 4.1.1)
 lazyeval       0.2.2   2019-03-15 [1] CRAN (R 4.1.0)
 lifecycle      1.0.0   2021-02-15 [1] CRAN (R 4.1.0)
 lubridate      1.7.10  2021-02-26 [1] CRAN (R 4.1.0)
 magrittr       2.0.1   2020-11-17 [1] CRAN (R 4.1.0)
 mime           0.11    2021-06-23 [1] CRAN (R 4.1.0)
 modelr         0.1.8   2020-05-19 [1] CRAN (R 4.1.0)
 munsell        0.5.0   2018-06-12 [1] CRAN (R 4.1.0)
 pillar         1.6.2   2021-07-29 [1] CRAN (R 4.1.0)
 pkgconfig      2.0.3   2019-09-22 [1] CRAN (R 4.1.0)
 plotly       * 4.9.4.1 2021-06-18 [1] CRAN (R 4.1.1)
 promises       1.2.0.1 2021-02-11 [1] CRAN (R 4.1.0)
 purrr        * 0.3.4   2020-04-17 [1] CRAN (R 4.1.0)
 R6             2.5.1   2021-08-19 [1] CRAN (R 4.1.0)
 RColorBrewer   1.1-2   2014-12-07 [1] CRAN (R 4.1.0)
 Rcpp           1.0.7   2021-07-07 [1] CRAN (R 4.1.0)
 readr        * 2.0.1   2021-08-10 [1] CRAN (R 4.1.1)
 readxl         1.3.1   2019-03-13 [1] CRAN (R 4.1.0)
 reprex         2.0.1   2021-08-05 [1] CRAN (R 4.1.0)
 rlang          0.4.11  2021-04-30 [1] CRAN (R 4.1.0)
 rmarkdown      2.11    2021-09-14 [1] CRAN (R 4.1.0)
 rprojroot      2.0.2   2020-11-15 [1] CRAN (R 4.1.0)
 rstudioapi     0.13    2020-11-12 [1] CRAN (R 4.1.0)
 rvest          1.0.1   2021-07-26 [1] CRAN (R 4.1.0)
 sass           0.4.0   2021-05-12 [1] CRAN (R 4.1.0)
 scales         1.1.1   2020-05-11 [1] CRAN (R 4.1.0)
 sessioninfo    1.1.1   2018-11-05 [1] CRAN (R 4.1.0)
 shiny        * 1.7.0   2021-09-22 [1] CRAN (R 4.1.0)
 shinyWidgets * 0.6.2   2021-09-17 [1] CRAN (R 4.1.1)
 snakecase      0.11.0  2019-05-25 [1] CRAN (R 4.1.1)
 sourcetools    0.1.7   2018-04-25 [1] CRAN (R 4.1.0)
 stringi        1.7.4   2021-08-25 [1] CRAN (R 4.1.1)
 stringr      * 1.4.0   2019-02-10 [1] CRAN (R 4.1.0)
 svglite        2.0.0   2021-02-20 [1] CRAN (R 4.1.0)
 systemfonts    1.0.2   2021-05-11 [1] CRAN (R 4.1.0)
 tibble       * 3.1.4   2021-08-25 [1] CRAN (R 4.1.1)
 tidyr        * 1.1.3   2021-03-03 [1] CRAN (R 4.1.0)
 tidyselect     1.1.1   2021-04-30 [1] CRAN (R 4.1.0)
 tidyverse    * 1.3.1   2021-04-15 [1] CRAN (R 4.1.1)
 tzdb           0.1.2   2021-07-20 [1] CRAN (R 4.1.0)
 utf8           1.2.2   2021-07-24 [1] CRAN (R 4.1.1)
 vctrs          0.3.8   2021-04-29 [1] CRAN (R 4.1.0)
 viridisLite    0.4.0   2021-04-13 [1] CRAN (R 4.1.0)
 vroom          1.5.4   2021-08-05 [1] CRAN (R 4.1.1)
 webshot        0.5.2   2019-11-22 [1] CRAN (R 4.1.0)
 withr          2.4.2   2021-04-18 [1] CRAN (R 4.1.0)
 xfun           0.24    2021-06-15 [1] CRAN (R 4.1.0)
 xml2           1.3.2   2020-04-23 [1] CRAN (R 4.1.0)
 xtable         1.8-4   2019-04-21 [1] CRAN (R 4.1.0)
 yaml           2.2.1   2020-02-01 [1] CRAN (R 4.1.0)

``` r
sessioninfo::session_info()
```

