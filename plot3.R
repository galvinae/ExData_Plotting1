##Exploratory Data Analysis Week 1: Project 1

##Examine how household energy usage varies over a 2-day period in Feb 2007.
##Construct several plots using the base plotting system.
##The data for this project is taken from the IC Irvine Machine Learning Repo

#Set the working directory & open the dplyr package:
setwd("C://Users/Amy/Desktop/RCoursera/ExploratoryDataAnalysis/Project1")
library(dplyr)

#Get data from web:
#Create a directory Data:
if(!file.exists("./household data")) {dir.create("./household data")}
#Create an object with the internet link:
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#Download internet file in the Data folder:
download.file(fileUrl, destfile = "./household data/household_power_consumption.zip", method = "auto")
#Unzip the file:
unzip ("./household data/household_power_consumption.zip")

#Read the file & subset on the rows of interest (rows 66637-69516):
fulldata<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE)
df<-fulldata[66637:69516,]

#Convert the dates to the standard date format:
df<-mutate(df, Date_Time = paste(df$Date, df$Time, sep = " "))
df$Date_Time <- strptime(df$Date_Time, "%d/%m/%Y %H:%M:%S")


##PLOT 3 -- line graphs of the sub_meters:
#No title -- submeter1=black; submeter2=red; submeter3=blue
png("plot3.png", width=480, height=480)
plot(df$Date_Time, df$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(df$Date_Time, df$Sub_metering_1, col = "black")
lines(df$Date_Time, df$Sub_metering_2, col = "red")
lines(df$Date_Time, df$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
