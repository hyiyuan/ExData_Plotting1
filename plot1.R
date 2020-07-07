setwd("C:/Users/hyiyuan/Downloads/exdata_data_household_power_consumption")
data<-read.delim("household_power_consumption.txt", sep=";")
plot_data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
plot_data$Global_active_power<-as.numeric(as.character(plot_data$Global_active_power))

png("plot1.png",width = 480,height = 480)
hist(plot_data$Global_active_power,col="red",main="Global Active Power", 
     xlab="Global Acitive Power (kilowatts)")
dev.off()
