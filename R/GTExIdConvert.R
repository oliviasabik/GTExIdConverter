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
  a = data.frame(variant_ids)
  colnames(a) = "variant_id"
  b = data.frame(do.call('rbind', strsplit(as.character(a$variant_id),'_',fixed=TRUE)))
  b = cbind(a,b)
  colnames(b) = c("variant_id", "chr", "position", "allele1", "allele2", "build")
  list_c = as.vector(unique(b$chr))
  list_c
  #pull data from github for variant ids
  if(length(list_c) == 1){
    myfile <- paste0("https://raw.github.com/oliviasabik/GTExVariantIdData/master/chr_", list_c[1], "_gtex_ids.txt")
  }else if(length(list_c) > 1){
    myfile <- paste0("https://raw.github.com/oliviasabik/GTExVariantIdData/master/chr_", list_c[1], "_gtex_ids.txt")
    for(i in 2:length(list_c)){
      myfile = c(myfile, paste0("https://raw.github.com/oliviasabik/GTExVariantIdData/master/chr_", list_c[i], "_gtex_ids.txt"))
    }
  }

  for(i in 1:length(myfile)){
    assign(paste0("chr_", list_c[i]), readr::read_tsv(myfile[1], col_names = FALSE))
  }
  #make the variant id input a data_frame, one per chromosome and merge
  c_list = vector(mode="character", length=length(list_c))
  for(i in 1:length(list_c)){
    print(i)
    c_list[i] = paste0("chr_", list_c[i])}
  for (i in 1:length(c_list)){
    curr_c = gsub("chr_", "", c_list[i])
    c = subset(b, b$chr == as.numeric(curr_c))
    d = get(c_list[1])
    colnames(d) = c("variant_id", "rs_id")
    e = merge(c, d, by = "variant_id", all.x = TRUE)
    e = e[,c(1,7)]
    assign(paste0("data_", curr_c), e)
  }
  #combine merged chromosomes
  d_list = vector(mode="character", length=length(list_c))
  for(i in 1:length(list_c)){
    print(i)
    d_list[i] = paste0("data_", list_c[i])}
 f = rbind(get(d_list))
 #return data
 return(f)
}
