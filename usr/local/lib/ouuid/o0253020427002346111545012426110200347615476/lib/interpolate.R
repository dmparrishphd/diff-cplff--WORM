interpolate <- function ( x , clpff , neighbors. , interpConst. ) {
    stopifnot (
        is.numeric ( x ) ,
        isCPLFF ( clpff ) )
    Info <- neighbors.
    names ( Info ) <- c ( "i" , "j" )
    Y0 <- as.matrix ( clpff [ Info $ i , -1 ] )
    Y1 <- as.matrix ( clpff [ Info $ j , -1 ] )
    DY <- Y1 - Y0
    Y  <- Y0 + DY * interpConst.
    i <- with ( Info , ! is.na ( i ) & ! is.na ( j ) & i == j )
    Y [ i , ] <- Y0 [ i , ]
    Y }
