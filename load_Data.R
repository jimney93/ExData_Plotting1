
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
                  header = T, stringsAsFactors = F, sep = ";", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)))

# convert character Date and Time columns to vector of date-time class
x <- strptime(paste(wrk$Date, wrk$Time), "%d/%m/%Y %H:%M:%S")
wrk$Date <- as.Date(x)
wrk$Time <- strftime(x, format = "%H:%M:%S")

dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

# return subset based on dates
df <- subset(wrk, Date %in% dates)

return(df)