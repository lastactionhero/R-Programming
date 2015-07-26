

pollutantmean <- function(directory, pollutant, id = 1:332){
  
  files <- list.files(path= paste("../",directory, sep=""), pattern="*.csv")
  data <- do.call("rbind", lapply(files[id], function(x) read.csv(x, stringsAsFactors = FALSE)))
  
  mean(data[,pollutant], na.rm=TRUE)
}
