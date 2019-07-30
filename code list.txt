

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


setwd("C://Users/Jing/Desktop/pro2/ParaData")
Dreams<-VCorpus(DirSource(".", ignore.case=TRUE, mode="text"))
p1 <- Dreams[[1]]
p3 <- Dreams[[3]]
Dreamslow <- tm_map(Dreams, content_transformer(tolower))
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
Dreamscl <- tm_map(Dreamslow,content_transformer(removeNumPunct))
Dreamscltdm <- TermDocumentMatrix(Dreamscl)
p3Txt <- p3$content






setwd("C://Users/Jing/Desktop/pro2/ParaData")
Dreams<-VCorpus(DirSource(".", ignore.case=TRUE, mode="text"))
dream1 <- Dreams[[1]]
Dtdm <- TermDocumentMatrix(Dreams)
d1tf <- termFreq(dream1)
d1df <- as.data.frame(d1tf)
Dreamslow <- tm_map(Dreams, content_transformer(tolower))
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
Dreamscl <- tm_map(Dreamslow,content_transformer(removeNumPunct))
Dreamscltdm <- TermDocumentMatrix(Dreamscl)
myStopword <- c(stopwords('english'))
Dreamsstop <- tm_map(Dreamscl, removeWords, myStopword)
Dreamstdm2 <- TermDocumentMatrix(Dreamsstop , control = list(wordLengths = c(1, Inf)))

DreamTxt <- Dreams[[1]]$content
Dreamtokens <- tokens(DreamTxt )

DreamSent <- syuzhet::get_nrc_sentiment(DreamTxt )
Dreamdfm <- dfm(Dreamtokens)
Dreamfreq <- docfreq(Dreamdfm )
Dreamwt <- dfm_weight(Dreamdfm ,scheme="prop")
str(Dreamwt)

Dreamtfidf<-dfm_tfidf(Dreamdfm, scheme_tf="count", scheme_df="inverse")

 
dreamspecialsplit <- paste(dream1, sep = " " ,collapse = "~-")
paralist <- strsplit(dreamspecialsplit, '(~-){2,}', perl=TRUE)
paralist2 <- gsub("(~-)", " ", paralist[[1]][1:59] )
t<- c(paralist[[1]][1:59])
tc <- create_tcorpus(c(t), doc_cloumn = "id") 

hits <- tc$search_features("dreams")
kwic <- tc$kwic(hits, ntokens = 3)



slist <- strsplit(paralist2[1:59] , '(?<![^!?.])\\s+', perl=TRUE)


****************************
para1= gsub("[^[:alpha:][:space:]]*", "", para1)
wlist <- strsplit(para1, " ", perl=TRUE)
matrix(wlist[[1]][1:169])
tdmpara1 <-  as.TermDocumentMatrix(mp,weighting=weightTf)


filepath = list()
filename = paste(1:59,".txt",sep="")
for(i in 1:59){
filepath[[i]] = paste("C://Users/Jing/Desktop/pro2/ParaData/",filename[i],sep="")
writeLines(paralist2[i], filepath[[i]])
}
************************************8

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

search_in_document ("reappearance")



 lineNo <- grep("dreams",dream1)   // 行号


dream2<- paste(dream1, sep = " " ,collapse = " ") 
charDoc <- as.character(dream2) 
sl<- strsplit(charDoc, '(?<![^!?.])\\s+', perl=TRUE) 
v = as.vector(unlist(sl))
i <- grep("dreams", v )     // 句子


 
 if(length(i <- grep("dreams", sl )))
  
 cat("'foo' appears at least once in text", txt, "\n")
'


 i 
 txt[i]


//list 转换成 vector


 
v = as.vector(unlist(sl))
tc <- create_tcorpus(c(v), doc_cloumn = "id")
hits <- tc$search_features("action")
sNo <- hits$hits

hits <- tc$search_features("action")



 
