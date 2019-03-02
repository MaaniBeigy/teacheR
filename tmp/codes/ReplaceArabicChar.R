ReplaceArabicChar <- function( inputVector)
{
  inputVector <- gsub(intToUtf8(1740),intToUtf8(1610),as.character(inputVector))
  inputVector <- gsub(intToUtf8(1705),intToUtf8(1603),as.character(inputVector))
  inputVector <- gsub('<U+06F9>','9',as.character(inputVector))
  #inputVector <- gsub('ئ',intToUtf8(1610),as.character(inputVector))

 return(inputVector) 
}
