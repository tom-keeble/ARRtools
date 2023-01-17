ARF_long <- function(area, duration, aep, region, params) {
  # Area in km-squre
  # Duration in minutes
  # aep as a fracion e.g. 0.01
  # region must be one of the 10 valid regions
  # params is a data frame of parameters a,...,i for all regions

  # Check the region is valid

  all.regions <- names(params)
  all.regions.txt <- stringr::str_c(all.regions, collapse = ', ')

  if(!(region %in% all.regions)) stop (stringr::str_c('Invalid region. You input "', region, '". Valid regions are ', all.regions.txt))

  # For the select region, assignment the parameters to a,...,i

  for(i in 1:9) {
    assign(letters[i], params[ ,region][i])
  }

  min(1, (1 - a*(area^b - c*log10(duration)) * duration ^-d +
            e*area^f*duration^g * (0.3 + log10(aep)) +
            h*10^(i*area*duration/1440) * (0.3 + log10(aep))))


}


ARF_short <- function(area, duration, aep) {

  a <- 0.287
  b <- 0.265
  c <- 0.439
  d <- 0.36
  e <- 0.00226
  f <- 0.226
  g <- 0.125
  h <- 0.0141
  i <- -0.021
  j <- 0.213

  min(1, (1 - a*(area^b - c*log10(duration)) * duration^(-d) +
            e*area^f*duration^g * (0.3 + log10(aep)) +
            h * area^j * 10^(i* (1/1440) * (duration - 180)^2)  * (0.3 + log10(aep))))
}

ARF <- function(area, duration, aep, region = NULL, params = NULL, neg_to_zero = TRUE) {



  # We only need a region and parameters if duration is greater than 12 hours so
  # these arguments are optional

  #neg_to_zero, set negative ARFs to zero, the default is TRUE

  # Define the functions we may need

  # Checking inputs


  if(area < 0 | area > 30000){
    warning('Area must be between zero and 30,000 km-squared')
    return(NA)
  }

  # if(aep > 0.5 | aep < 0.005) {
  #   warning('AEP must be between 0.5% and 50%, returning NA')
  #   return(NA)
  # }
  # This is not used because AEPS < 0.05 will not be input, and an AEP of 0.632 is necessary to use.

  if(duration > 7*24*60 | duration < 0){
    warning('Duration must be positive and less than 10080 min (7 days)')
    return(NA)
  }

  if(duration <= 720 & area > 1000) {
    warning(str_c("Generalized equations are not applicable for short durations when catchment areas exceed 1000 km-squared.",
                  "If area > 1000, duration must be greater than 12 hours (720 mins)"))
    return(NA)
  }

  if(duration > 720){
    params <-
      structure(list(`East Coast North` =     c(0.327,  0.241, 0.448, 0.36,  0.00096,   0.48,  -0.21,   0.012,   -0.0013),
                     `Semi-arid Inland QLD` = c(0.159,  0.283, 0.25,  0.308, 7.3e-07,   1,      0.039,  0,        0),
                     Tasmania =               c(0.0605, 0.347, 0.2,   0.283, 0.00076,   0.347,  0.0877, 0.012,   -0.00033),
                     `SW WA` =                c(0.183,  0.259, 0.271, 0.33,  3.845e-06, 0.41,   0.55,   0.00817, -0.00045),
                     `Central NSW` =          c(0.265,  0.241, 0.505, 0.321, 0.00056,   0.414, -0.021,  0.015,   -0.00033),
                     `SE Coast` =             c(0.06,   0.361, 0,     0.317, 8.11e-05,  0.651,  0,      0,        0),
                     `Southern Semi-arid` =   c(0.254,  0.247, 0.403, 0.351, 0.0013,    0.302,  0.058,  0,        0),
                     `Southern Temperate` =   c(0.158,  0.276, 0.372, 0.315, 0.000141,  0.41,   0.15,   0.01,    -0.0027),
                     `Northern Coastal` =     c(0.326,  0.223, 0.442, 0.323, 0.0013,    0.58,  -0.374,  0.013,   -0.0015),
                     `Inland Arid` =          c(0.297,  0.234, 0.449, 0.344, 0.00142,    0.216, 0.129,  0,        0)),
                class = "data.frame", row.names = c("a", "b", "c", "d", "e", "f", "g", "h", "i"))

  }

  #

  if(area <= 1) return(1)

  if(duration >= 1440){
    if(area >= 10){
      return(ARF_long(area, duration, aep, region, params))

    }

    # area < 10
    # interpolate based on area between the long duration ARF for 10 km-square
    # and an ARF of 1

    ARF.long.10 <- ARF_long(10, duration, aep, region, params)
    ARF = 1 - 0.6614*(1-ARF.long.10)*(area^0.4 - 1)


    return(ARF)

  }
  if(duration <= 720){
    if(area >= 10){
      if(area > 1000) {
        warning('Generalised equations are not applicable for short duration events on areas > 1000 km-squared.')
        return(NA)
      }
      ARF <- ARF_short(area, duration, aep)
      if(neg_to_zero) ARF <- max(0, ARF) # Sometimes, short duration events on large catchments produce values less than zero, so they are set to zero.
      return(ARF)
    }

    # area < 10 and duration less than 12 hours
    # interpolate based on area between the short duration ARF for 10 km-square
    # and an ARF of 1

    ARF.short.10 <- ARF_short(10, duration, aep)
    ARF = 1 - 0.6614*(1-ARF.short.10)*(area^0.4 - 1)

    return(ARF)
  }


  # duration between 720 and 1440 i.e. between 12 hours and 24 hours

  if(area > 1 & area < 10){
    # 1. Calculate long duration ARF for 10 km-squared and 24 hours duration

    ARF.long.24 <- ARF_long(10, 1440, aep, region, params)

    # 2. Calculate short duration ARF for 10 km-squared and 12 hours (720 min)

    ARF.short.12 <- ARF_short(10, 720, aep)

    # 3. Interpolate   ARF for 10 km-squared and selected duration

    ARF.interp.10 <- ARF.short.12 + (ARF.long.24 - ARF.short.12)*(duration - 720)/720

    #4. Interpolate ARF for catchment area and selected duration

    ARF <- 1 - 0.6614*(1-ARF.interp.10)*(area^0.4 - 1)


    return(ARF)
  }


  if(area >= 10){

    # 1 Calculate long duration ARF for 24 hours and selected area, duration and AEP

    ARF.long.24 <- ARF_long(area, 1440, aep, region, params)

    # 2. Calculate short duration ARF for 12 hours and selected duration and AEP

    ARF.short.12 <- ARF_short(area, 720, aep)

    # 3. Interpolate for the selected duration and AEP

    ARF <- ARF.short.12 + (ARF.long.24 - ARF.short.12)*(duration - 720)/720

    return(ARF)

  }

  # Should never fall through to here

  stop('Error in ARF calculations')


}
