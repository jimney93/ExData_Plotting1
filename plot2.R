# load function
source("load_Data.R")

# load data if data directory not found
if(!file.exists("data/household_power_consumption.txt")){
  message ("======> loading data")
  df <- load_data()
}

# PNG file per requirements
png("plot2.png", width = 480, height = 480)

plot(df$Time, df$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
)
dev.off()