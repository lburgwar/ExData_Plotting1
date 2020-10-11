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
plot(data$date_time,as.numeric(data$Global_active_power),
     type = 'l',
     col='black',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

#Write to file
png('plot2.png',width=480, height=480)
plot(data$date_time,as.numeric(data$Global_active_power),
     type = 'l',
     col='black',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')
dev.off()



