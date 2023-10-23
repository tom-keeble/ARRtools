# ARRtools
R package containing tools for implementing Australian Rainfall and Runoff (ARR) methods.

This package wraps a collection of tools developed to implement aspects of the recommended ARR methods in R.
It has been created with limited dependencies, and as such should work without any additional packages beyond the base R installation (at least as of R 4.0).

To install, the easiest method is via this github. You can do this by first installing `devtools` (if not already) then using the contained `install_github` to install this package:

    # install.packages('devtools') ## if needed
    library('devtools')
    install_github("Tom-Keeble/ARRtools")
    
