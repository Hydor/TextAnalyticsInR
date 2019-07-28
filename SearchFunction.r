install.packages("tm")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("textreuse")
install.packages("wordnet")
install.packages("zipfR")
install.packages("quanteda")
install.packages("syuzhet")
install.packages("corpustools")
install.packages("fingerprint")
install.packages("stringi", type = "win.binary")


library(tm)
library(ggplot2)
library(quanteda)
library(zipfR)
library(wordcloud)
library(corpustools) 
library(stringi)


## a function to find a specific word or phrase

search_in_document <- function(temp_word) {
  l <- list()
  dlist <- list()
  hits <- tc$search_features(temp_word)
  sNo <- hits$hits
  slist <- as.list(sNo$token_id)
  if(length(lineNo <- grep(temp_word,dream1) ))
  {
  	dlist = as.list(c(1))
  }
  linelist <- as.list(lineNo)
  l <- list( Document_ID = c(dlist),Line_No = c(linelist), Token_No=c(slist) )
   print(l) 
 }




## test examples


search_in_document("features")