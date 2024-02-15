#This is R_for_Beginners_DataAnalysis.R 

setwd("/cloud/project")

# In this section you will:
# 3.1 Learn to read in csv files to RStudio environment and assign to variable
# 3.2 Analyze data in RStudio
# 3.3 Calculate statistics on data in RStudio
# 3.4 Write files from RStudio to Desktop
# 3.5 More practice (adapted from Ted Laderas)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.1 Learn to read in csv files to RStudio environment and assign to variable
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# The first thing we will do is read in the dataset using 
read.csv(file = "STEM_Careers_FM.csv", row.names = 1, header = TRUE)

#But while it's good we can read in the data, we need to store it do do actual things with the data
#We store data in variables
data=read.csv("STEM_Careers_FM.csv", row.names = 1, header = TRUE)

#Now lets call the variable and see what it shows us
data

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.2 Analyze data in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#If we want to know how many rows and columns are in our dataset we can use a function called dim() 
dim(data)

#Sometimes it's important to know what the rownames or column names of the dataset you are looking at are. There's a handy
#function called rownames() or colnames() that can tell you!
rownames(data)

colnames(data)

#Let's inspect what type of data this is and what is in each column
is.data.frame(data)
data$Female #The dollar sign tells us what column we are intersted in
data$Male 

# Now we might be interseted in looking at sorted data
data[order(data$Female),] #This data is sorted in increasing order on the Female column
data[order(data$Male),] ##This data is sorted in increasing order on the Male column

data[order(-data$Female),] #This data is sorted in decreasing order on the Female column
data[order(-data$Male),] #This data is sorted in decreasing order on the Male column

data_sorted=data[order(-data$Female, -data$Male),] #This data is sorted in decreasing order by Females then by males

#Maybe we want to see how the data we are looking at is distrubuted, to do that we can use another function
#called summary()
summary(data)

#

#Now the stats are all well and good, but sometimes it's nice to actually SEE what the data is. To look at
#in the simplest way, you can use the function boxplot()
boxplot(data)

#The y-label is overlapping the y-axis values. The numbers are acutally really big, 
#we could clean them up
data
data/100000
data_short=data/100000
data_short

#So now when we plot the data we can see a cleaner visualization 
boxplot(data = data_short, las=1, 
        xlab="Sex", #label the x-axis
        ylab="Number of STEM Jobs (1x10^5)", #label the y-axis 
        main="Number of STEM Jobs Held by Females & Males in 2017") #write in a title

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.3 Calculate statistics on data in RStudio
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#As you can see there are more males in STEM careers than females. Is this statistically significant?
#To run a t-test on this data, we can use the function t.test()
#Because we are comparing the numer of females in the data to the number of males we need to include those
#fields when we can do this two different ways (either as a dataframe or a matrix)
t.test(data$Female, data$Male)

#We can store the output of the t-test into variables
data_tt=t.test(data$Female, data$Male)

#We can call up specific elements of the t-test by using the $ 
data_tt$p.value

#A fun little function for rounding numbers is to use the round() function
round(data_tt$p.value, digits=2)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.4 Save the data
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Oh, I want to save this new dataset to my desktop as a csv file
write.csv(data_sorted, "STEM_Careers_FM_Sorted.csv")
write.csv(data_short, "STEM_Careers_FM_Short.csv")


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   3.5 More practice (adapted from Ted Laderas)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### 1. Object manipulation
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Instructions:
## Create an object called `agge` that contains your age in years. 
## Then reassign the object to a new object called `age` (e.g., correct the typo). 
## Then remove the previous object from your environment and then calculate your age in days
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# You code now:
# create agge object
agge = 21
# reassign agge value to age
age = agge
# remove agge object
rm(agge)
# Use math to calculate your age in days
ageindays = age * 365B

### 2. Vector manipulation (character data):
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Instructions:
## Create a object called `buildings` representing a vector that contains four names of buildings on Lincoln's campus, 
## including the building where we have class (here's a reference: https://www.lincoln.edu/_files/campus-map.pdf).
## Add `Lincoln University` to the beginning of the vector, and `Wawa` to the end of the vector
## subset the vector to show only the building in which you have class.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# You code now:
#create buildings object
buildings <- c()
Buildings = c("Laney", "SUB", "ASL", "Ivory Neslon Science Building")
#Add "Lincoln University" to the beginning of buildings
Buildings = c("Lincoln University", Buildings)
#Add "Wawa" to the end of buildings
Buildings = c(Buildings, "Wawa")
#subset buildings to show only your building
Buildings[4]


## 3. Vector manipulation (numerical data):
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Instructions:
## The following vector represents the number of vacation days possessed by various employees.

## How many employees are represented in the vector?
  
## How many vacation days total?
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
# You code now:
vacation_days <- c(5, 7, 20, 1, 0, 0, 12, 4, 2, 2, 2, 4, 5, 6, 7, 10, 4)

#how many employees are represented in the vector?
length (vacation_days)
#how many vacation days total?
sum(vacation_days)

