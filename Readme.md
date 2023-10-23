# ARRtools
An R package containing tools for implementing Australian Rainfall and Runoff (ARR) methods.

This package wraps a collection of tools developed to implement aspects of the recommended ARR methods in R.

The ARR methods are drawn from select parts of the [ARR guidelines](http://book.arr.org.au.s3-website-ap-southeast-2.amazonaws.com/). The current suite of included functions are primarily focused on he methods contained in Book 2 of the Guidelines, with particular focus on Chapters 3 and 4. These chapters describe methods associated with design rainfall and Areal Reduction Factors, the latter being the original driver of this package's inception.

The package functions are built to specifically utilise associated design rainfall data, which is accessible via the [BOM website](http://www.bom.gov.au/water/designRainfalls/revised-ifd/). They have been created with limited dependencies, and as such should work without any additional packages beyond the base R installation (at least as of R 4.0).

## Installation

Step 0: If not already, you will need to have `devtools` installed. It can be installed using the instructions [here](http://www.rstudio.com/products/rpackages/devtools/), or more simpley by un-commenting the first line of the below script. Note that for the purposes of this package, [installing `Rtools`](https://cran.r-project.org/bin/windows/Rtools/) is not necessary. 

Step 1: Install `ARRtools` directly from my GitHub repository using `install_github("tom-keeble/ARRtools")`. For the purposes of this package, you may ignore the error about `Rtools` (unless you already have it installed, in which case the warning will not appear.)

In general, it will be enough to run the below:

    # install.packages('devtools') ## if needed
    library('devtools')
    install_github("tom-keeble/ARRtools")
    

## Request for feedback and help

I put this package together because it helped to solve/automate a few specific tasks that I was repeatedly implementing. If it solves your problem, or you find it useful in your own work, please let me know. If it needs to be modified to solve your problem, or if you find any errors in the package or contained functions, please either 

  * open an issue on GitHub, or 
  * even better, fork, fix, and issue a pull request.
