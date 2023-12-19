# ARRtools
An R package containing tools for implementing Australian Rainfall and Runoff (ARR) methods.

This package wraps a collection of tools developed to implement aspects of the recommended ARR methods in R.

The ARR methods are drawn from select parts of the [ARR guidelines](http://book.arr.org.au.s3-website-ap-southeast-2.amazonaws.com/). The current suite of included functions are primarily focused on the methods contained in Book 2 of the Guidelines, with particular focus on Chapters 3 and 4. These chapters describe methods associated with design rainfall and Areal Reduction Factors (ARF), the latter being the original driver of this package's development.

The package functions are built to specifically utilise associated design rainfall data, which is accessible via the [BOM website](http://www.bom.gov.au/water/designRainfalls/revised-ifd/). They have been created with limited dependencies, and as such should work without any additional packages beyond the base R installation (at least as of R 4.0).

## Installation

Step 0: If not already, you will need to have `devtools` installed. It can be installed using the instructions [here](http://www.rstudio.com/products/rpackages/devtools/), or more simply by un-commenting the first line of the below script. Note that for the purposes of this package, [installing `Rtools`](https://cran.r-project.org/bin/windows/Rtools/) is not necessary. 

Step 1: Install `ARRtools` directly from this GitHub repository using `install_github("tom-keeble/ARRtools", branch = "master")`. For the purposes of this package, you may ignore the error about `Rtools` (unless you already have it installed, in which case the warning will not appear).

In general, it will be enough to run the below:

    # install.packages('devtools') ## if needed
    library('devtools')
    install_github("tom-keeble/ARRtools", branch = "master")
    

## Supporting data

Included with this package is a raster layer of the ARF_regions, intended as a way of easily defining which region/associated parameters to use with `ARF()` calculations. Expected use would be, for example, `terra::extract()` of the region at point(s) locations. Within the installed package directory, this file can be found at `/extdata/ARF_regions.tif`.

## Upcoming additions

Planned updates to the package include: 

  * Addition of an interpolation method to extract exact AEP values given specific rainfall intensities at locations (from the design rainfall quantiles).
  * **ADDED 2/11/23** <del>The addition of a minimal-file-size raster of the national ARF regions to support parameterisation of ARF calculations.</del>

## Request for feedback and help

I put this package together because it helped to solve/automate a few specific tasks that I was repeatedly implementing. If it solves your problem, or you find it useful in your own work, please let me know. If it needs to be modified to solve your problem, or if you find any errors in the package or contained functions, please either 

  * Open an issue on GitHub, or 
  * Even better, fork, fix, and issue a pull request.
