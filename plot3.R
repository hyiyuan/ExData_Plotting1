setwd("C:/Users/hyiyuan/Downloads/exdata_data_household_power_consumption")
data<-read.delim("household_power_consumption.txt", sep=";",
                 stringsAsFactors = FALSE)
plot_data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
datetime<-strptime(paste(plot_data$Date,plot_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plot_data$Sub_metering_1<-as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2<-as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3<-as.numeric(plot_data$Sub_metering_3)

png("plot3.png",width = 480,height = 480)

plot(datetime, plot_data$Sub_metering_1,type="n",
     ylab="Energy sub metering",xlab = "")
lines(datetime, plot_data$Sub_metering_1,type="l",col="black")
lines(datetime, plot_data$Sub_metering_2,type="l",col="red")
lines(datetime, plot_data$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col=c("black", "red", "blue"))

dev.off()
