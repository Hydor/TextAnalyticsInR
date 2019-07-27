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



######### Part C WordClouds

textdend <- readLines("pg20842.txt", n=20)
docs <- Corpus(VectorSource(testdend))
inspect(docs)

docs <- tm_map(docs, content_transformer(tolower))

docs <- tm_map(docs, removeRunctuation)

denddtm <- TermDocumentMatrix(docs)
View(denddtm)



## created a data frame from the matrix and used that to create the wordcloud

m <- as.matrix(denddtm)
v <- sort(rowSums(m),decreasing = TRUE)
d <- data.frame(word = name(v),freq=v)
head(d,10)

wordcloud(word =d$word, freq = d$freq, min.freq = 1, max.words= 200, ramdom.order = FALSE, rot.per=0.35,colors= brewer.pal(8,"Dark2"))



## Dendrograms

distMatrix <- dist(scale(denddtm))
distMatrix

fit <- hclust(distMatrix, method="ward.D2")
plot(fit)