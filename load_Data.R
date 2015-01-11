# load_data function will download dataset from specified url
# data is loaded into a separate directory in the working directory
# if the directory is not found one will be created

load_data <- function(){
    # download dataset from UC Irvine Machine Learning Repo
    url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
    temp <- tempfile(fileext = ".zip")
    download.file(url, temp, method = "curl")
    
    # unz to data folder
    if(!file.exists("data")){
      dir.create("data") 
    }
    unzip(temp, list=F, exdir = "data")
    # unlink temp
    unlink(temp)
    
    wrk <- read.table("./data/household_power_consumption.txt", 
                      header = T, 
                      stringsAsFactors = F, 
                      sep = ";", 
                      colClasses = c(rep("character", 2), rep("numeric", 7)),
                      na.strings = "?")
    
    # convert character Date and Time columns to vector of date-time class
    wrk$Time <- strptime(paste(wrk$Date, wrk$Time), "%d/%m/%Y %H:%M:%S")
    wrk$Date <- as.Date(wrk$Date, "%d/%m/%Y")
  #  wrk$Time <- strftime(x, format = "%H:%M:%S")
    
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    
    # return subset based on dates
    df <- subset(wrk, Date %in% dates)
    return(df)
}