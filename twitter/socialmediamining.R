#import positive and negative words 

pos - readLines("positive_words.txt")
neg - readLines("negative_words.txt")

library("stringr")
library("plyr")


score.sentiment = function(sentences, pos.words, neg.words, .progress= "none")

{
  scores = laply(sentences,
                 function(sentence, pos.words, neg.words)
                 sentence = gsub("[[:punc:]]", "", sentence)
                 sentence - gsub("[[:cntr:]]", "", sentence)
                 sentence = gsub('\\d+', '', sentence)
                 
                 tryTolower - function(x){
                   y = NA
                   try_error = tryCatch(tolower(x), error =function(e) e)
                   if (!inherits(try_error, "error"))
                     y = tolower(x)
                   return(y)
                 }
                sentence = sapply(sentence, tryTolower) 
                 
                word.list = str_split(sentence, "\\s+")
                words = unlist(word.list)
                
                pos.matches = match(words, pos.words)
                neg.matches = match(words, neg.words)
                
                pos.matches = !is.na(pos.matches)
                neg.matches = !is.na(neg.matches)
                
                score = sum(pos.matches) - sum(neg.matches)
                return(score)
                }, pos.words, neg.words, .progress=.progress)  
  
 #tweet api goes here         