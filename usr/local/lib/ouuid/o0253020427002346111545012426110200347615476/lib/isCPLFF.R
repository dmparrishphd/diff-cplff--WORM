isCPLFF <- function ( X ) {
    vapply. <- function ( f ) vapply ( X [ -1 ] , f , NA , USE.NAMES = FALSE )
    is.data.frame ( X ) &&
    2 <= length ( X ) &&
    isMonotonicallyIncreasing ( X [[ 1 ]] ) &&
    all ( vapply. ( is.numeric ) ) &&
    all ( vapply. ( function ( x ) all ( is.finite ( x ) ) ) ) }
