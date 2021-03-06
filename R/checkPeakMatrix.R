#' Check if peak matrix is in format features in rows, samples in columns 
#' and that all cell contain numeric values. 
#' 
#' All functions in pmp pacakge expect input peak matrix to have samples 
#' as columns and measured features in rows. This function will check input 
#' matrix orientation and will transpose it if needed. If class labels are 
#' provided this function will check if the length of labels matches number 
#' of samples in peak matrix.
#'
#' @param peak_data peak matrix
#' @param classes Vector of class labels
#' @return matrix where samples are represented in columns and features in rows
#' @examples 
#' 
#' attach(testData)
#' out <- check_peak_matrix(peak_data=t(testData$data))
#' 
#' @export

check_peak_matrix <- function(peak_data, classes=NULL) {
    dims <- dim(peak_data)
    is_data_frame <- is.data.frame(peak_data)
    
    if (dims[1] < dims[2] & is.null(classes)) {
        peak_data <- t(peak_data)
        warning("Peak table was transposed to have features as rows and samples
    in columns. \n
    As there were no class labels availiable please check that peak table is \n
    still properly rotated, samples as columns and features in rows. \n
    Use 'check_df=FALSE' to keep original peak matrix orientation.")
    }
    
    if (!all(apply (peak_data, 2, typeof)!="factor" & 
        apply(peak_data, 2, typeof)!="character")){
        stop ("Peak matrix contains non-numeric values. Check your inputs!")
    }
    
    if (!is.null(classes)) {
        hits <- which(dims == length(classes))
        if (length(hits) == 2) {
            warning(" Number of samples and features is the same in your
            data matrix, 
            please make sure that you samples are in columns. \n")
        } else if (length(hits) == 0) {
            stop(" Length of sample classes doesn't match any dimension
            of input data. 
            Sample labels should match number of samples. \n")
        } else if (hits == 1) {
            # If samples are in rows, transpose data matrix
            peak_data <- t(peak_data)
        }
    }
    
    if (is_data_frame) {
        peak_data <- as.data.frame(peak_data)
    }
    
    peak_data
}
