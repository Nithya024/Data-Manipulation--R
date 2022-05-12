##----------------------Data Manipulation with R-----------------------###
getwd()
setwd("D://Files")

## oj.csv -->The data contain weekly sales of refrigerated orange juice in 64-
#ounce containers for 83 stores in a chain (Dominick's Finer Foods
# (DFF)), in the Chicago area. The data refer to sales for 121 weeks and 
#three different brands (Dominicks, MinuteMaid and Tropicana).

oj<-read.csv("oj.csv")
head(oj)
dim(oj)
str(oj)
unique(oj$brand)

## indexing/slicing
oj[1,3]

oj[c(1,2,4,5),c(1,3)]
oj[,"brand"]
# base R package

#Subseting
#Selecting only those rows where brand bought is tropicana
data1<-oj[oj$brand=='tropicana',]
# tropicana or dominicks
data2<-oj[oj$brand=='tropicana'| oj$brand=='dominicks',]
# tropicana and no feature advertisement
data3<-oj[oj$brand=='tropicana'& oj$feat==0,]


#Selecting Columns

data4<-oj[,c("week","brand")]

#Selecting+Subsetting
data5<-oj[oj$brand=='tropicana'& oj$feat==0,c("week","brand")]

oj[,-17]
#Adding new columns
oj$INC<-oj$INCOME+1

oj<-oj[,-18]
##----------------------------------------------
#Sorting data
#ascending order
data6<-oj[order(oj$week),]

#descending order
data7<-oj[order(-oj$week),]
##---------------------------------------

##Group by summaries

#Average price of juice across brands

#Syntax aggregate(variable to be summarized, 
#by=list(variable by which grouping is to be done),function)

agg<-aggregate(oj$price,by=list(oj$brand),mean)

#Renaming the column
names(agg)<-c("Group-wise","avg_price")
#Apply functions
t<-tapply(oj$price,oj$brand,mean)
class(t)
sapply(oj,min)
lapply(oj$price,sum)
#Cross tabulation
# Units of different brands sold based on if feature advertisement was
#run or not

tab<-table(oj$brand,oj$feat)
tab
tab1<-xtabs(oj$INCOME~oj$brand+oj$week)
tab1
##------------------------------------------------------------------------###

#dplyr
#install.packages("dplyr")
library(dplyr)

# subsetting
data8<-filter(oj,brand=='tropicana')
data8
data9<-filter(oj, brand=='tropicana'| brand=='dominicks')
#Selecting Columns

data10<-select(oj,brand,feat)
#Removing columns
data11<-select(oj,-brand,-feat)

#Creating a new column
data12<-mutate(oj,INC=INCOME+1)


#Arranging data 
data13<-arrange(oj,INCOME)
data14<-arrange(oj,desc(INCOME))

#Group Wise summaries

gr_brand=group_by(oj,brand)
summarize(gr_brand,mean(price))
#Pipelines %>%

oj%>%group_by(brand)%>%summarise(mean(price))

##Date
strDates="01/20/2014"
#base-R 
date1<-as.Date(strDates,format="%m/%d/%Y")


#install.packages("lubridate")
library(lubridate)
date="20180519"

date2<-ymd(date)
date<-format(date2,"%d-%b-%Y")
date
##-------------------- Handling dates ------------------------

##flight delay
fd<-read.csv("Fd.csv")
str(fd)
fd$FlightDate<-as.Date(fd$FlightDate,format="%d-%b-%y")
#Subsetting data based on time information
#Subset the data for day=Sunday
# The number of flights on sunday
fd%>%filter(weekdays(FlightDate)=='Sunday')%>%nrow()

# The number of flights on Sundays for destination Atlanta

fd%>%filter(weekdays(FlightDate)=='Sunday',DestCityName=='Atlanta, GA')%>%nrow()


#Find the number of flights on Sundays for all cities


#------------------------------------------------------------##
#POSIXct and POSIXlt

#POSIXct:

date3<-as.POSIXct(Sys.time())
class(date3)
#POSIXlt: 
date4<-as.POSIXlt(Sys.time())
date4$year
###----------------------------------------------------------##

#Merging data
##Joins using Merge
df1 = data.frame(CustomerId=c(1:6),Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6),State=c(rep("Alabama",2),rep("Ohio",1)))
merge(x=df1,y=df2,by="CustomerId",all=TRUE)#outer join
merge(x=df1,y=df2,by="CustomerId",all.x=TRUE) #left join
merge(x=df1,y=df2,by="CustomerId",all.y=TRUE) #right join
merge(x=df1,y=df2,by="CustomerId")#inner join
.
#-----------------------------------Handling missing values----------------------------------------------#

#Missing values
a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)
sum(is.na())


data()   # get datasets in R
air<-airquality
colSums(is.na(air))
#Imputing Missing values
air$Ozone[is.na(air$Ozone)]<-mean(air$Ozone,na.rm=TRUE)

#Note: #mean(x) # returns NA
#mean(x, na.rm=TRUE) # returns 2){remove/not consider NA}
#create new data set with no missing values by using na.omit(data)
#------------------------------------------------------------------------------------------#
#install.packages("reshape2")
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
age<-c(26,24,25)
weight<-c(70,60,65)
df<-data.frame(person,age,weight)
df
melted<-melt(df,id="person")##wide to long
melted
dcast(melted,person~variable,sum)# long to wide
#-----------------------------------------------------------------------------------------#
#String manipulation
y<-"Batman"
substr(y,start=2,stop=5)
nchar(y)

tolower(y)
toupper(y)
b<-"Bat-Man"

strsplit(b,split="-")
c<-"Bat/Man"

paste(b,c)

grep("-",c(b,c))
grepl("/",c(b,c))

sub("-","/",b)

gsub("-","/",b)
#----------------------------------------------------------------------

#sqldf
install.packages("sqldf")
library(sqldf)

#Using SELECT statement to select the columns brand,income, and feat

oj_s<-sqldf("select brand,income,feat from oj")
#Subseting using where statement
oj_s<-sqldf("select brand,income,feat from oj where price<3.8 and income<10")

#Order by statement
oj_s<-sqldf("select brand,income,feat from oj order by income asc")
#distinct
sqldf("select distinct brand from oj")

#Demo sql functions
sqldf("select avg(income) from oj")
sqldf("select min(price) from oj")

##-----------------------------------end----------------------------------------------###





