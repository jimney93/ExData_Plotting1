# load function
# source("load_Data.R")

# load data if data directory not found
if(!file.exist("data/household_power_consumption.txt")){
  message ("loading data")
  df <- load_data()
}

# PNG file per requirements
png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
  )
dev.off()