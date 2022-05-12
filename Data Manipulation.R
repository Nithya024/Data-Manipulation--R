##----------------------Data Manipulation with R-----------------------###

## oj.csv -->The data contain weekly sales of refrigerated orange juice in 64-
#ounce containers for 83 stores in a chain (Dominick's Finer Foods
# (DFF)), in the Chicago area. The data refer to sales for 121 weeks and 
#three different brands (Dominicks, MinuteMaid and Tropicana).

# base R package

#Subseting
#Selecting only those rows where brand bought is tropicana






#Selecting Columns



#Selecting+Subsetting



#Adding new columns



##----------------------------------------------
#Sorting data


##---------------------------------------




##Group by summaries

#Average price of juice across brands

#Syntax aggregate(variable to be summarized, 
#by=list(variable by which grouping is to be done),function)



#Renaming the column



#Apply functions



#Cross tabulation
# Units of different brands sold based on if feature advertisement was
#run or not




##------------------------------------------------------------------------###

#dplyr
#install.packages("dplyr")
library(dplyr)

# subsetting


#Selecting Columns


#Removing columns


#Creating a new column



#Arranging data 



#Group Wise summaries



#Pipelines





##Date
strDates="01/20/2014"




#install.packages("lubridate")
library(lubridate)
date="20180519"




##-------------------- Handling dates ------------------------

flight delay-->
fd<-read.csv("Fd.csv")




#Subsetting data based on time information
#Subset the data for day=Sunday
# The number of flights on sunday


# The number of flights on Sundays for destination Atlanta




#Find the number of flights on Sundays for all cities


#------------------------------------------------------------##
#POSIXct and POSIXlt

#POSIXct:
#POSIXlt: 


###----------------------------------------------------------##

#Merging data
##Joins using Merge
df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6),State=c(rep("Alabama",2),rep("Ohio",1)))



.
#-----------------------------------Handling missing values----------------------------------------------#

#Missing values
a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)



data()   # get datasets in R
air<-airquality




#Imputing Missing values




#Note: #mean(x) # returns NA
#mean(x, na.rm=TRUE) # returns 2){remove/not consider NA}
#create new data set with no missing values by using na.omit(data)
#------------------------------------------------------------------------------------------#
#install.packages("reshape2")
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
age<-c(26,24,25)
weight<-c(70,60,65)


#-----------------------------------------------------------------------------------------#
#String manipulation
y<-"Batman"



b<-"Bat-Man"


c<-"Bat/Man"






#----------------------------------------------------------------------

#sqldf
install.packages("sqldf")
library(sqldf)

#Using SELECT statement to select the columns brand,income, and feat


#Subseting using where statement


#Order by statement

#distinct
sqldf("select distinct brand from oj")

#Demo sql functions
sqldf("select avg(income) from oj")
sqldf("select min(price) from oj")

##-----------------------------------end----------------------------------------------###





