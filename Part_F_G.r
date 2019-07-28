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
library(wordnet)
library(ggplot2)
library(quanteda)
library(zipfR)
library(ggplot2)
library(wordcloud)
library(corpustools) 
library(stringi)



## Part f


Dreamslow <- tm_map(Dreams, content_transformer(tolower))
dreaml= Dreamslow[[1]]
dreamcl = gsub("[^[:alpha:][:space:]]*", "", dreaml)
dreamFreq <- termFreq(dreamcl)
freqtable = as.data.frame(dreamFreq )
freq1 = freqtable [1]
freq1



## Part g


ngramtext<-concatenate(ngramtext)

ngramtext = preprocess(ngramtext , case ="LOWER", remove.punct = TRUE)

ng<-ngram(ngramtext, n=2)

get.phrasetable(ng)

## omitted rows between 39 and 295 (and 27 rows after 333)

ng <- ngram(ngramtext, n=3)

get.phrasetable(ng)

