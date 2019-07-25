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

setwd("C://Users/Jing/Desktop/pro2/Dataset")
Dreams<-VCorpus(DirSource(".", ignore.case=TRUE, mode="text"))
dream1 <- Dreams[[1]]




## Part d

## longest sentence in each paragraph


dreamspecialsplit <- paste(dream1, sep = " " ,collapse = "~-")
paralist <- strsplit(dreamspecialsplit, '(~-){2,}', perl=TRUE)
paralist2 <- gsub("(~-)", " ", paralist[[1]][1:59] )

slist <- strsplit(paralist2[[1]][1:59] , '(?<![^!?.])\\s+', perl=TRUE)

for (paras in slist){
count = 0
max_sentence_len = 0
max_sentence = ""
  for (line in paras){
    count=str_count(line, '\\w+')
	if(count > max_sentence_len){
        max_sentence = line
        max_sentence_len = count
        }
  }
print(max_sentence_len)
}



## longest word in each paragraph
 
paralist3  <- gsub("[^[:alpha:][:space:]]*", "", paralist2)
wlist <- strsplit(paralist3[1:59], " ", perl=TRUE)

for (paras in wlist){
 len = 0
 max_word_len = 0
 max_word = ""
   for (word in paras){
     len=nchar(word)
 if(len > max_word_len ) {
     max_word = word
     max_word_len = len
   }
   }
   print(max_word )
}



## print table of shortest and longest sentences

list_data <- list(c("LongestSentence","ShortestSentence"))

index = 1
for (paras in slist){
  count = 0
  max_sentence_len = 0
  min_sentence_len = 10000
    for (line in paras){
      count=str_count(line, '\\w+')
      if(count > max_sentence_len){
          max_sentence_len = count
      }
      if(count < min_sentence_len) {
          min_sentence_len = count
      }
   }
list_data[index] <-  list(c(max_sentence_len,min_sentence_len ))
index = index + 1
}
  
table_d = as.data.frame(list_data , row.names =c("LongestSentence","ShortestSentence"))
print(table_d)
