setwd("C:/Users/hyiyuan/Downloads/exdata_data_household_power_consumption")
data<-read.delim("household_power_consumption.txt", sep=";",
                 stringsAsFactors = FALSE)
plot_data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
plot_data$Global_active_power<-as.numeric(plot_data$Global_active_power)
datetime<-strptime(paste(plot_data$Date,plot_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(datetime, plot_data$Global_active_power,type="l",
     ylab="Global Acitive Power (kilowatts)",xlab = "")
dev.off()
