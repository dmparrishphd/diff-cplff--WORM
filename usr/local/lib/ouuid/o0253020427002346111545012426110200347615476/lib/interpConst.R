interpConst <- function ( to , from , neighbors. ) {
    stopifnot (
        is.numeric ( to ) ,
        isMonotonicallyIncreasing ( from ) )
    Info <- neighbors.
    names ( Info ) <- c ( "i" , "j" )
    Info $ X0 <- from [ Info $ i ]
    Info $ X1 <- from [ Info $ j ]
    Info $ DX <- with ( Info , X1 - X0 )
    IC <- double ( nrow ( neighbors. ) )
    i  <- with ( Info , is.finite ( X0 ) & is.finite ( X1 ) & X0 != X1 )
    IC [   i ] <- ( to [ i ] - Info $ X0 [ i ] ) / Info $ DX [ i ]
    IC [ ! i ] <- 0
    IC }
