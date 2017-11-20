source('functions.R')

# read in the CSV file with the raw scores
rawscores <- read.csv('../data/rawdata/rawscores.csv', header=TRUE)

# use sink()
sink(file = '../output/summary-rawscores.txt')
str(rawscores, vec.len = 1)
for(i in 1:ncol(rawscores)){
print_stats(rawscores[,i])
}
sink()

# for loop, traversing the columns of the data frame, to replace all missing values NA with zero.
for(i in 1:ncol(rawscores)){
  rawscores[,i][is.na(rawscores[,i])] <- 0
}

# rescale100() to rescale QZ1: 0 is the minimum, and 12 is the max.
rawscores$QZ1 <- rescale100(rawscores$QZ1,xmin=0, xmax=12)

# rescale100() to rescale QZ2: 0 is the minimum, and 18 is the max.
rawscores$QZ2 <- rescale100(rawscores$QZ2,xmin=0, xmax=18)

# rescale100() to rescale QZ3: 0 is the minimum, and 20 is the max.
rawscores$QZ3 <- rescale100(rawscores$QZ3,xmin=0, xmax=20)

# rescale100() to rescale QZ4: 0 is the minimum, and 20 is the max.
rawscores$QZ4 <- rescale100(rawscores$QZ4,xmin=0, xmax=20)

# rescale100() to add a variable Test1 by rescaling EX1 (0 is the minimum, and 80 is the max)
Test1 <- rescale100(rawscores$EX1,xmin=0, xmax=80)
rawscores <- cbind(rawscores,Test1)

# rescale100() to add a variable Test2 by rescaling EX2 (0 is the minimum, and 90 is the max)
Test2 <- rescale100(rawscores$EX2,xmin=0, xmax=90)
rawscores<- cbind(rawscores, Test2)

# Homework(drop the lowest score and then averaging)
Homework <- c()
for(i in 1:nrow(rawscores)){
    newhw<- drop_lowest(as.numeric(rawscores[i,1:9]))
    Homework[i] <- get_average(newhw)
}
rawscores <- cbind(rawscores,Homework)

# Quiz (drop the lowest score and then averaging)
Quiz <- c()
for(i in 1:nrow(rawscores)){
  newquiz<- drop_lowest(as.numeric(rawscores[i,11:14]))
  Quiz[i]<- get_average(newquiz)
}
rawscores<- cbind(rawscores,Quiz)

# Overall
lab <- c()
hw <- c()
quiz <- c()
test1 <- c()
test2 <- c()
total <- c()
for(i in 1:nrow(rawscores)){
   lab[i] <- score_lab(rawscores$ATT[i])*0.1
   hw[i] <- (rawscores$Homework[i])*0.3
   quiz[i] <- (rawscores$Quiz[i])*0.15
   test1[i] <- (rawscores$Test1[i])*0.2
   test2[i] <- (rawscores$Test2[i])*0.25
   total[i] <- sum(lab[i], hw[i], quiz[i], test1[i], test2[i])
}
 Overall <- total 
 rawscores <- cbind (rawscores,lab)
 rawscores <- cbind(rawscores, Overall)

# letter Grade
Grade <- c()
for(i in 1:334){
  if(rawscores$Overall[i]>= 95 & rawscores$Overall[i]<=100 ){
    Grade[i] <- "A+"
  }else if (rawscores$Overall[i]>=90 & rawscores$Overall[i]<95){
    Grade[i] <- "A"
  }else if (rawscores$Overall[i]>=88 & rawscores$Overall[i]<90){
    Grade[i] <- "A-"
  }else if (rawscores$Overall[i]>=86 & rawscores$Overall[i]<88){
    Grade[i] <- "B+"
  }else if (rawscores$Overall[i]>=82 & rawscores$Overall[i]<86){
    Grade[i] <- "B"
  }else if (rawscores$Overall[i]>=79.5 & rawscores$Overall[i]<82){
    Grade[i] <- "B-"
  }else if (rawscores$Overall[i]>=77.5 & rawscores$Overall[i]<79.5){
    Grade[i] <- "C+"
  }else if (rawscores$Overall[i]>=70 & rawscores$Overall[i]<77.5){
    Grade[i] <- "C"
  }else if (rawscores$Overall[i]>=60 & rawscores$Overall[i]<70){
    Grade[i] <- "C-"
  }else if (rawscores$Overall[i]>=50 & rawscores$Overall[i]<60){
    Grade[i] <- "D"
  }else{
    Grade[i] <- "F"
  }
}

rawscores <- cbind(rawscores, Grade)

# sink ()
sink(file = '../output/Lab-stats.txt')
print_stats(lab)
sink()

sink(file = '../output/Homework-stats.txt')
print_stats(hw)
sink()

sink(file = '../output/Quiz-stats.txt')
print_stats(quiz)
sink()

sink(file = '../output/Test1-stats.txt')
print_stats(test1)
sink()

sink(file = '../output/Test2-stats.txt')
print_stats(test2)
sink()

sink(file = '../output/Overall-stats.txt')
print_stats(Overall)
sink()

sink(file = '../output/summary-cleanscores.txt')
str(rawscores, vec.len = 1)
sink()

# export the clean data frame of scores to a CSV file
write.csv(rawscores,"../data/cleandata/cleanscores.csv",row.names = FALSE)









  
