isMonotonicallyIncreasing <- function ( x )
        is.numeric ( x ) &&
        1L < length ( x ) &&
        ! any ( is.na ( x ) ) &&
        ! any ( duplicated ( x ) ) &&
        ! is.unsorted ( x )
