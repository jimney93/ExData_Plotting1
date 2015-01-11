# load function
source("load_Data.R")

# load data if data directory not found
if(!file.exists("data/household_power_consumption.txt")){
  message ("======> loading data")
  df <- load_data()
}

# PNG file per requirements
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(df, {plot(df$Time, df$Global_active_power,
              type = "l",
              ylab = "Global Active Power",
              xlab = "")
          plot(df$Time, df$Voltage,
              type = "l",
              ylab = "Voltage",
              xlab = "datetime")
          plot(df$Time, df$Sub_metering_1, 
              type = "l",
              ylab = "Energy sub metering", 
              xlab = "")
              lines(df$Time, df$Sub_metering_2, col = "red")
              lines(df$Time, df$Sub_metering_3, col = "blue")
              legend("topright", col = c("black", "red", "blue"), 
              c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
              lty = 1,
              box.lwd = 0)
          plot(df$Time, df$Global_reactive_power, 
              type = "n",
              ylab = "Global_reactive_power", 
              xlab = "datetime")    
              lines(df$Time, df$Global_reactive_power)
      }
  )

dev.off()