
#Read data into a dataframe
dataset_url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

temp <- tempfile()
download.file(dataset_url,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header=TRUE,sep=';')
unlink(temp)

#Add a column as a date/time class
data$date_time = strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Subset for two days: 2007-02-01 and 2007-02-02
data = subset(data, Date=='1/2/2007' | Date=='2/2/2007')

#Make a line plot
plot(data$date_time,as.numeric(data$Sub_metering_1),
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')

#Add more lines
lines(data$date_time,as.numeric(data$Sub_metering_2),col='red')
lines(data$date_time,as.numeric(data$Sub_metering_3),col='blue')

# Add a legend
legend(x="topright",
       legend=c('Sub_metering_1',
       'Sub_metering_2',
       'Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1, cex=0.8)

#Write to file
png('plot3.png',width=480, height=480)
plot(data$date_time,as.numeric(data$Sub_metering_1),
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')

#Add more lines
lines(data$date_time,as.numeric(data$Sub_metering_2),col='red')
lines(data$date_time,as.numeric(data$Sub_metering_3),col='blue')

# Add a legend
legend(x="topright",
       legend=c('Sub_metering_1',
       'Sub_metering_2',
       'Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1, cex=0.8)
dev.off()



