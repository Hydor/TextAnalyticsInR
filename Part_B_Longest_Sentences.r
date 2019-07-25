install.packages("tm")
install.packages("quanteda")


library(tm)
library(quanteda)
library(stringi)


## Part B
## Find the 10 longest sentences

dream2<- paste(dream1, sep = " " ,collapse = " ") 
charDoc <- as.character(dream2) 
sl <- strsplit(charDoc, '(?<![^!?.])\\s+', perl=TRUE)


sentence_len = 0 
for (line in sl){
   sentence_len =  str_count(line, '\\w+')
 print(sentence_len )
}


for (line in sl[[1]]){
  if(str_count(line, '\\w+')>= 51){
  print(line)
     }
 }
