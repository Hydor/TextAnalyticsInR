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


## Part a

setwd("C://Users/Jing/Desktop/pro2/Dataset")

Dreams<-VCorpus(DirSource(".", ignore.case=TRUE, mode="text"))

inspect(Dreams)

str(Dreams)

dream1 <- Dreams[[1]]

Dtdm <- TermDocumentMatrix(Dreams)

inspect(Dtdm[1:300,1:1])

d1tf <- termFreq(dream1)

d1df <- as.data.frame(d1tf)

Dreamslow <- tm_map(Dreams, content_transformer(tolower))

removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)

Dreamscl <- tm_map(Dreamslow,content_transformer(removeNumPunct))
Dreamscltdm <- TermDocumentMatrix(Dreamscl)
Dreamscltdm

inspect(Dreamscltdm[1:300,1:1])

myStopword <- c(stopwords('english'))
Dreamsstop <- tm_map(Dreamscl, removeWords, myStopword)
inspect(Dreamsstop[1:1])

Dreamstdm2 <- TermDocumentMatrix(Dreamsstop , control = list(wordLengths = c(1, Inf)))
Dreamstdm3 <- TermDocumentMatrix(Dreamsstop, control = list(wordLengths = c(1, Inf), weighting=weightBin))
Dreamstdm4 <- TermDocumentMatrix(Dreamsstop, control = list(wordLengths = c(1, Inf), weighting=weightTfIdf))


freq.terms <- findFreqTerms(Dreamstdm2, lowfreq = 5)

findAssocs(Dreamstdm2, "something", 0.25)

freq.terms3 <- findFreqTerms(Dreamstdm3, lowfreq = 5)

freq.terms4 <- findFreqTerms(Dreamstdm4, lowfreq = 5)


term.freq <- rowSums(as.matrix(Dreamstdm2))
term.freq <- subset(term.freq, term.freq >= 15)
df <- data.frame(term = names(term.freq), freq = term.freq)

#For draw the plot I change the term.freq to larger than 15

term.freq <- subset(term.freq, term.freq >= 15)
ggplot(df, aes(x = term, y = freq)) + geom_bar(stat = "identity") + xlab("Terms") + ylab("Count") + coord_flip()

tdm2 <- removeSparseTerms(Dtdm, sparse = 0.50)
disMatrix <- dist(scale(tdm2))

test1 <- Dreamsstop[[1]]
inspect(test1)


fit <- hclust(disMatrix, method = "ward.D2")
plot(fit)


Dreamdtm <- DocumentTermMatrix(Dreamsstop)
freq <- colSums(as.matrix(Dreamdtm))
ord <- order(freq, decreasing =TRUE)

Dreamdtmr <- DocumentTermMatrix(Dreamsstop, control = list(wordLengths = c (4,20)))

freqr <- colSums(as.matrix(Dreamdtmr))
ordr <- order(freqr, decreasing =TRUE)
DreamTxt <- Dreams[[1]]$content
Dreamtokens <- tokens(DreamTxt )
DreamSent <- syuzhet::get_nrc_sentiment(DreamTxt )
Dreamdfm <- dfm(Dreamtokens)
Dreamfreq <- docfreq(Dreamdfm )



Dreamwt <- dfm_weight(Dreamdfm ,scheme="prop")
str(Dreamwt )

Dreamtfidf<-dfm_tfidf(Dreamdfm, scheme_tf="count", scheme_df="inverse")
Dreamtfidf@i
