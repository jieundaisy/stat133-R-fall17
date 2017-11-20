#' @title remove_missing 
#' @description remove NA
#' @param x numeric vector
#' @return vector without missing values 
remove_missing <- function(x){
  x <- x[!is.na(x)]
  return (x)
}

#' @title get_minimum
#' @description compute minimum value
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return min 
get_minimum <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  
  if (na.rm == FALSE){
    b <- sort(x)
    return(b[1])
  }else{
    x <- remove_missing(x)
    b <- sort(x)
    return(b[1])
  }
}

#' @title get_maximum
#' @description compute maximum value
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return max
get_maximum <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  
  if (na.rm == FALSE){
    b <- sort(x)
    return(b[length(b)])
  }else{
    x <- remove_missing(x)
    b <- sort(x)
    return(b[length(b)])
  }
}

#' @title get_range
#' @description compute range value(max-min)
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return range 
get_range<- function (x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  max <- get_maximum(x) 
  min <- get_minimum(x)
  r = max-min
  return (r)
}

#' @title get_percentile10
#' @description compute 10th percentile of input vector 
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return 10th percentile 
get_percentile10 <- function (x, na.rm =FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  per10 <- quantile(x, 0.1, na.rm=TRUE, names = FALSE)
  return (per10)
}

#' @title get_percentile90
#' @description compute 90th percentile of input vector 
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return 90th percentile 
get_percentile90 <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  per90 <- quantile(x, 0.9, na.rm = TRUE, names = FALSE)
  return (per90)
}

#' @title get_median
#' @description compute the median of the input vector  
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return median 
get_median <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  
  if(na.rm == FALSE){
    m <- sort(x)
  }else{
    x <- remove_missing(x)
    m <- sort(x)
  }   
    if(length(m) %%2 == 0){
       i <- length(m)/2
       md <- (m[i] + m[i+1])/2
       return (md)
     }else{
       i <- (length(m)+1)/2
       md <- m[i]
       return (md)
     }
}

#' @title get_average 
#' @description compute the average of the input vector  
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return mean 
get_average <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }

  if(na.rm == TRUE){
    x <- remove_missing(x)
  }
    sum_entries <- 0
    for(i in 1:length(x)){
     sum_entries<- sum_entries + x[i]
    } 
  return(sum_entries/length(x))
} 

#' @title get_stdev
#' @description compute the standard deviation of the input vector  
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return sd 
get_stdev <- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  
  if(na.rm == TRUE){
    x <- remove_missing(x)
  }
  std <- 0
  for(i in 1: length(x)){
    std <- std + (x[i]- get_average(x))^2
  }
   std <- sqrt(std/(length(x)-1))
   return (std)
}

#' @title get_quartile1
#' @description compute the first quartile of the input vector  
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return 1st quartile(0.25)
get_quartile1<- function(x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  per25 <- quantile(x, 0.25, na.rm=TRUE, names = FALSE)
  return (per25)
}

#' @title get_quartile3
#' @description compute the third quartile of the input vector  
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return 3rd quartile(0.75)
get_quartile3 <- function (x, na.rm = FALSE){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  per75 <- quantile(x, 0.75, na.rm = TRUE, names = FALSE)
  return (per75)
}

#' @title count_missing
#' @description calculate the number of NA  
#' @param x numeric vector
#' @return the number of NA
count_missing <- function (x){
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  missing <- 0
  for (i in 1:length(x)){
    if(is.na(x[i])){
      missing <- (missing + 1) 
    }
  }
  return (missing)
}

#' @title summary_stats
#' @description show summary statistics of input vector   
#' @param x numeric vector
#' @return a list of summary statistics 
summary_stats <- function(x){
  flist <- list (
    minimum = get_minimum(x,na.rm=TRUE),
    percent10 = get_percentile10(x,na.rm=TRUE),
    quartile1 = get_quartile1(x,na.rm=TRUE),
    median = get_median(x,na.rm=TRUE),
    mean = get_average(x,na.rm=TRUE),
    quartile3 = get_quartile3(x,na.rm=TRUE),
    percent90 = get_percentile90(x,na.rm=TRUE),
    maximum = get_maximum(x,na.rm=TRUE),
    range = get_range(x,na.rm=TRUE),
    stdev = get_stdev(x,na.rm=TRUE),
    missing = count_missing(x)
  )
  return (flist)
}

#' @title print_stats
#' @description show summary statistics of input vector in nice format   
#' @param x numeric vector
#' @return the values of summary statistics in nice format  
print_stats <- function (x){
   title <- names(summary_stats(x))
   max_char <- max(nchar(title))
   for(i in 1:length(summary_stats(x))){
     count_char <- nchar(title[i])
     diff_char <- max_char - count_char
     add_space <- paste(rep(" ",diff_char),collapse = '')
     cat(paste0(title[i], add_space,':'), sprintf('%0.4f', summary_stats(x)[[i]]),'\n')
   }
}

#' @title rescale100
#' @description compute a rescaled vector with a potential scale from 0 to 100  
#' @param x numeric vector
#' @param xmin a minimum
#' @param xmax a maximum
#' @return rescaled vector
rescale100<- function(x,xmin,xmax){
  z <- 100*(x-xmin)/(xmax-xmin)
  return(z)
}

#' @title drop_lowest
#' @description drop the lowest value and print a new vector   
#' @param x numeric vector
#' @return vector by dropping lowest value 
drop_lowest <- function(x){
     m <- get_minimum(x)
     i <- 1
    while(m != x[i]){
      x[i] <- x[i] 
      i <- i+1
    }
     return(x[-i])
}

#' @title score_homework
#' @description compute a single homework value  
#' @param x numeric vector
#' @param drop whether to drop the lowest values
#' @return the average of homework scores
score_homework <- function(x, drop= FALSE){
  if(drop == TRUE){
    x <- drop_lowest(x)
    x <- get_average(x)
    return(x)
  }else{
    x <- get_average(x)
    return(x)
  }
}

#' @title score_quiz
#' @description compute a single quiz value  
#' @param x numeric vector
#' @param drop whether to drop the lowest values
#' @return the average of quiz scores
score_quiz <- function(x, drop = FALSE){
  if(drop == TRUE){
    x <- drop_lowest(x)
    x <- get_average(x)
    return(x)
  }else{
    x <- get_average(x)
    return(x)
  }
}

#' @title score_lab
#' @description compute lab score based on lab attendance 
#' @param x numeric value of lab attendance (ranges between 0 and 12)
#' @return lab score
score_lab <- function(x){
  if(x==12 || x==11){
    return(100)
  }else if(x==10){
    return(80)
  }else if(x==9){
    return(60)
  }else if(x==8){
    return(40)
  }else if(x==7){
    return(20)
  }else{
    return (0)
  }
}

