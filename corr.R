corr = function(directory, threshold = 0) {
  files <- list.files(path= paste("../",directory, sep=""), pattern="*.csv")
  calculateComplete <- 
    function(x)
    {
      data <- read.csv(x, stringsAsFactors = FALSE)
      data[complete.cases(data),]
      
    }
  
  
  
  idObservations <- complete(directory)
  selectedObservations <- subset(idObservations,nobs > threshold)
  selectedObservations
  correlations <- rep(NA,length(selectedObservations))
  
  id <- selectedObservations$id
  
  correlations <- rep(NA,length(id))
  
  totalData  <- do.call("rbind", lapply(files[id], calculateComplete))
  i=1
  for(myid in id)
  {
    myData <- subset(totalData,ID==myid)
    SulfateData <- myData[, 2]
    NitrateData <- myData[, 3]
    correlations[i]=cor(x=SulfateData,y=NitrateData)
    i =i+1
  }
  correlations[complete.cases(correlations)]
  # totalData
  
}
