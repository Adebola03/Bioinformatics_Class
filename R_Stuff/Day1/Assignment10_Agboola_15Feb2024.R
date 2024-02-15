#Next, include a setwd() to where you want your Script to live
setwd("")
setwd("/cloud/project/Bioinformatics_Class-main/R_Day1/")
#Then, read in the CS_Data_Demographics.csv table to R and create Barplot using what we learned above.
# This dataset shows the number Females and Males who have careers in Computer Science and is stratified 
#by ethnicity and race

CS_dem=read.csv()
CS_dem=read.csv("CS_Demographics.csv")
#Starting with the base requirements for the barplot() function, make the plot look pretty!
barplot(t(CS_dem), beside=TRUE)

# Checklist
# A. Scale the numbers to fit in the y-axis of the plot -- save to new variable
# B. Change the rownames to fit on the x-axis of the plot
# C. Label the axis 
# D. Give plot a name
# E. Change the colors of the plot for fun
# F. Export barplot as a pdf file to your desktop

#Answers
par(bg = "#efedf5")
barplot(CS_dem_Short_tt, beside = TRUE, las=1,cex.axis = 1,cex.names = 1, xlab = "Race/Ethnicity", ylab = "Number of jobs(1x10^3)",col = c("#C8A2C8","#1c9099"),ylim = c(0,1500), main = "Prevalence of Race/Ethnicities in Computer Science Career")
legend("topright", legend=c("Female", "Male"), fill=c("#C8A2C8", "#1c9099"), cex=0.5)
names3=c("His/Lat = Hispanic/Latino", "Am/Al = American Indian/Alaska Native", 
           +          "Bl/AA = Black/African American", "NH/PI = Native Hawaiian/Other Pacific Islander", "W = White", 
           +          "More = More than one race")

legend("topleft", legend = names3, col=c(1), cex = 0.5)