complete = function(directory, id = 1:332) {
  files <- list.files(path= paste("../",directory, sep=""), pattern="*.csv")
  
  calculateComplete <- 
    function(x)
    {
      data <- read.csv(x, stringsAsFactors = FALSE)
      data[complete.cases(data),]
      
    }
  
  allData <- do.call("rbind", lapply(files[id], calculateComplete))
  do.call("rbind",lapply(unique(allData$ID), function(d)  data.frame(id=d,nobs=nrow(subset(allData,ID==d)))))
  
}