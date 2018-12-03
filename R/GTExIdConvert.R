#' GTExIdConverter
#'
#' This functions allows you to convert GTEx variant IDs to rsIDs.
#' @param variant_ids required. A vector of GTEx variant IDs
#'
#' @keywords gtex, variants, eQTL
#' @export
#' @examples
#' \dontrun{
#' data(gtex_variant_ids)
#' gtexIdConvert()}
#'

GTExIdConvert <- function(variant_ids){

  #check the input data is provided
  if(missing(variant_ids)){
    stop("Please specify a vector of GTEx variant IDs.")
  }

  #detect which chr are in the variant ids
  #pull data from github for variant ids
  myfile <- "https://raw.github.com/oliviasabik/GTExVariantIdData/master/chr_1_gtex_ids.txt"
  chr_1 <- readr::read_tsv(myfile, col_names = FALSE)

  #make the variant id input a data_frame, one per chromosome
  a = data.frame(variant_ids)

  #merge the dataframe with the variant ids by chromosome
  b = merge(a, )

  #combine merged chromosomes

  #return data
}
