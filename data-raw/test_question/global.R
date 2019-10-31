FQuestionId <-rep(1L,4);
FQuestionTxt <-rep('how are you?',4);
FAnswerId <-1L:4L;
FAnswerTxt<-LETTERS[1:4];
data <-data.frame(FQuestionId,FQuestionTxt,FAnswerId,FAnswerTxt,stringsAsFactors = F)

library(tsui);