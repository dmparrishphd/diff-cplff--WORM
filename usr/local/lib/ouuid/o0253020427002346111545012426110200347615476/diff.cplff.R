function ( pathname ) {

    `%//%` <- paste0

    LIB <- pathname %//% "/lib"

    En <- new.env ( parent = baseenv () )

    for ( Name in c (
        "/isMonotonicallyIncreasing.R" ,
        "/isCPLFF.R" ,
        "/neighbors.R" ,
        "/interpConst.R" ,
        "/interpolate.R" ) )
            source ( LIB %//% Name , local = En )

    `environment<-` (
        source ( LIB %//% "/diff.cplff.R" , local = En ) [[ 1 ]] ,
        En ) }
