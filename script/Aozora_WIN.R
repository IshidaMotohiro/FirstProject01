# USAGE:
# source ("Aozora_WIN.R")
# Aozora_WIN ("test.txt")

Aozora_WIN <- function(x){
  if(!file.exists (x)) stop ("specify file!")
#  tmp <- 1
  con <- file(x, 'r')
  outfile <- file(paste(x, "-w.txt", sep = ""), 'w')
  flag <- 0;
  while (length(input <- readLines(con, n=1)) > 0){
    if (grepl("^��{", input)) break ;
    if (grepl("�y���͎Ғ��z", input)) break;
    if (grepl("^------", input)) {
      flag <- !flag
      next;
    }
    if (!flag){
      input <- gsub ("�m��[^�n]*�n", "", input, perl = TRUE)
      input <- gsub ("�s[^�t]*�t", "", input, perl = TRUE)
      input <- gsub ("�b", "", input, perl = TRUE)
      writeLines(input, con=outfile)
#      tmp <- tmp +1
#      if (tmp > 100) stop ("something wrong")
    }
  }
  close(con); close(outfile)
}