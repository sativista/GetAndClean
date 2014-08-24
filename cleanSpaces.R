cleanSpaces <- function(srcFile, destFile) {
  
  allReaded <- 0
  src <- file(srcFile, open = "r")
  dest <- file(destFile, open = "w")
  
  while (length(oneLine <- readLines(src, n=1)) > 0) {
    # Remove leading and trailing whitespace.
    oneLine <- gsub("^\\s+|\\s+$", "", oneLine)
    
    oneLine <- gsub("\\s+", " ", oneLine)
    
      
    writeLines(oneLine, dest)
    allReaded <- allReaded + 1
  } 

  close(src)
  close(dest)
  
  return (allReaded)
}