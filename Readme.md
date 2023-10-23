# ARRtools
An R package containing tools for implementing Australian Rainfall and Runoff (ARR) methods.

The ARR methods 

This package wraps a collection of tools developed to implement aspects of the recommended ARR methods in R.
It has been created with limited dependencies, and as such should work without any additional packages beyond the base R installation (at least as of R 4.0).

## Installation

Step 0: If not already, you will need to have `devtools` installed. It can be installed using the instructions [here](http://www.rstudio.com/products/rpackages/devtools/), or more simpley by un-commenting the first line of the below script. Note that for the purposes of this package, [installing `Rtools`](https://cran.r-project.org/bin/windows/Rtools/) is not necessary. 

Step 1: Install `ARRtools` directly from my GitHub repository using `install_github("Tom-Keeble/ARRtools")`. For the purposes of this package, you may ignore the error about `Rtools` (unless you already have it installed, in which case the warning will not appear.)

In general, it will be enough to run the below:

    # install.packages('devtools') ## if needed
    library('devtools')
    install_github("Tom-Keeble/ARRtools")
    

## Request for feedback and help

I put this package together because it helped to solve/automate a few specific tasks that I was repeatedly implementing. If it solves your problem, or you find it useful in your own work, please let me know. If it needs to be modified to solve your problem, or if you find any errors in the package or contained functions, please either 

  * open an issue on GitHub, or 
  * even better, fork, fix, and issue a pull request.
