diff.cplff <- function ( X1 , X2 , interpolations = FALSE ) {
    stopifnot (
        isCPLFF ( X1 ) ,
        isCPLFF ( X2 ) ,
        is.logical ( interpolations ) ,
        interpolations %in% c ( TRUE , FALSE ) )
    X11 <- X1 [[ 1 ]]
    X21 <- X2 [[ 1 ]]
    x   <- sort ( union ( X11 , X21 ) )
    NB1 <- neighbors   ( x , X11 )
    NB2 <- neighbors   ( x , X21 )
    IC1 <- interpConst ( x , X11 , NB1 )
    IC2 <- interpConst ( x , X21 , NB2 )
    Y1  <- interpolate ( x , X1 , NB1 , IC1 )
    Y2  <- interpolate ( x , X2 , NB2 , IC2 )
    DF  <- data.frame ( x = x , Y1 - Y2 )
    NC  <- ncol ( Y1 )
    COLNOS <- seq_len ( NC )
    names ( DF ) [ -1 ] <- paste0 ( "D" , COLNOS )
    if ( interpolations ) {
        I1 <- ! ( DF $ x %in% X11 )
        I2 <- ! ( DF $ x %in% X21 )
        D1 <- data.frame ( Y1 )
        D2 <- data.frame ( Y2 )
        names ( D1 ) <- paste0 ( "Y1I" , COLNOS )
        names ( D2 ) <- paste0 ( "Y2I" , COLNOS )
        DF <- cbind ( DF , I1 , I2 , D1 , D2 ) }
    DF }
