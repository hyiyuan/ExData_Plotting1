setwd("C:/Users/hyiyuan/Downloads/exdata_data_household_power_consumption")
data<-read.delim("household_power_consumption.txt", sep=";",
                 stringsAsFactors = FALSE)
plot_data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
datetime<-strptime(paste(plot_data$Date,plot_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plot_data$Sub_metering_1<-as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2<-as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3<-as.numeric(plot_data$Sub_metering_3)
plot_data$Voltage<-as.numeric(plot_data$Voltage)
plot_data$Global_reactive_power<-as.numeric(plot_data$Global_reactive_power)
plot_data$Global_active_power<-as.numeric(plot_data$Global_active_power)

png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

plot(datetime, plot_data$Global_active_power,type="l",
     ylab="Global Acitive Power (kilowatts)",xlab = "")

plot(datetime,plot_data$Voltage,type="l",
     ylab="Voltage",xlab="datetime")

plot(datetime, plot_data$Sub_metering_1,type="n",
     ylab="Energy sub metering",xlab = "")
lines(datetime, plot_data$Sub_metering_1,type="l",col="black")
lines(datetime, plot_data$Sub_metering_2,type="l",col="red")
lines(datetime, plot_data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, col=c("black", "red", "blue"),bty="n")

plot(datetime,plot_data$Global_active_power,type="l",
     ylab="Global_active_power",xlab="datetime")

dev.off()
