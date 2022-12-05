neighbors <- ( function () {

    inItv <- function ( x , itv ) ifelse (
        x < itv [[ 1 ]] , FALSE , ifelse (
        x < itv [[ 2 ]] , TRUE , FALSE ) )

    whichInterval <- function ( x , intervals ) {
        j <- 1L
        while ( ! inItv ( x , intervals [ , j ] ) )
                j [[ 1 ]] <- 1L + j [[ 1 ]]
        j }

    function ( x , .data ) {
        Which <- integer ( length ( x ) )
        ITV <- matrix ( nrow = 2 , byrow = TRUE , data = c (
            -Inf , .data , .data , Inf ) )
        Which [[ 1 ]] <- whichInterval ( x [[ 1 ]] , ITV )
        for ( i in seq_along ( x ) [ -1 ] ) {
            Prev <- Which [[ i - 1 ]]
            Which [[ i ]] <- -1L + Prev + whichInterval (
                x [[ i ]] ,
                ITV [ , Prev : ncol ( ITV ) , drop = FALSE ] ) }
        DF <- data.frame ( i1 = Which - 1L , i2 = Which )
        DF [ DF [[ 1 ]] < 1 , 1 ] <- NA
        DF [ length ( .data ) < DF [[ 2 ]]  , 2 ] <- NA
        i <- x %in% .data
        DF [ i , "i2" ] <- DF [ i , "i1" ]
        DF } } ) ()
