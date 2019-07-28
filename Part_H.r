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


## Part h   

## corpusTools

t<- c(paralist[[1]][1:59])
tc <- create_tcorpus(c(t), doc_cloumn = "id")
tc 

hits <- tc$search_features("dreams")
hits
hits$hits

kwic <- tc$kwic(hits, ntokens = 3)
head(kwic$kwic, 3)



## Stringi

x <- stri_replace_all (t, "" , regex = "<.*?>")
x <- stri_trim(x)
x <- stri_trans_tolower(x)



## quanteda

DreamTxt <- Dreams[[1]]$content
Dreamtokens <- tokens(DreamTxt )
Dreamtokens 


Dreamtokens <- tokens_tolower(Dreamtokens)
Dreamtokens <- tokens_wordstem(Dreamtokens )

sw <- stopwords("english")
head(sw)
tokens_remove(Dreamtokens ,sw) 
