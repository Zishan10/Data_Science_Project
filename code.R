data1 <- read.csv("C:\\Users\\zisha\\OneDrive\\Desktop\\IDS Project MID\\Dataset_1.csv")
data1


#Shape of Dataset
summary(data1)
str(data1)

#Showing attribute names
attributes(data1)
ls(data1)

#types of data
typeof(data1$Borrower)
typeof(data1$Loan)
typeof(data1$Interest_rate)
typeof(data1$Credit_Score)

#mean,median and mode for Loan and Interest_rate attributes
install.packages('dplyr')
library(dplyr)
data1[,2:3] %>% summarise_if(is.numeric, mean) 
data1[,2:3] %>% summarise_if(is.numeric, median) 

install.packages("DescTools")
library(DescTools)
Mode(data1$Loan)
Mode(data1$Interest_rate)

#range and standard Deviation for Loan and Interest_rate attributes
install.packages('dplyr')
library(dplyr)
data1[,2:3] %>% summarise_if(is.numeric, sd)
range(data1$Loan)
range(data1$Interest_rate)




#Mode for credit score using pre-defined function
install.packages("DescTools")
library("DescTools")
Mode(data1$Credit_Score)






#####################################################################################################





data2 <- read.csv("C:\\Users\\zisha\\OneDrive\\Desktop\\IDS Project MID\\Dataset_2.csv")
data2


#finding missing value for all attributes
data2$Type[data2$Type==""] <- NA
colSums(is.na(data2))


#detecting outlier as missing values

v <- 1:19
plot(v,data2$Price)

data2$Price[data2$Price<=300000] <- NA
data2

#factor categorical data

data2$Type = factor(data2$Type,
                    levels = c("h","m","l"), 
                    labels = c(1,2,3))
data2


#deleting rows
data2
removed_row = 
  data2[complete.cases(data2$Rooms,data2$Price), ]
removed_row



#Replacing missing value with mean

data2$Rooms[is.na(data2$Rooms)] = mean(data2$Rooms, na.rm = TRUE)
data2$Price[is.na(data2$Price)] = mean(data2$Price, na.rm = TRUE)
data2


#Replacing missing value with median
data2$Price[is.na(data2$Price)] = median(data2$Price, na.rm = TRUE)
data2$Rooms[is.na(data2$Rooms)] = median(data2$Rooms, na.rm = TRUE)
data2


#Replacing missing value with mode
library("DescTools")
data2$Rooms[is.na(data2$Rooms)] <- Mode(data2$Rooms, na.rm=TRUE)
data2$Price[is.na(data2$Price)] <- Mode(data2$Price, na.rm=TRUE)
data2
