####Chi Square Goodness of Fit####

# Learning Objective: Compute the chi-square goodness-of-fit test and evaluate the assumptions using R

# First, return to section 17.4 of the textbook
# What are the 2 assumptions needed to compute a chi-square goodness-of-fit test? 

# Read through example 17.1 regarding the study on frequency of dreaming and ability to recall dreams
# What is the null hypothesis? 
# What is the alternate hypothesis? 

# We can compute the test statistic by hand or by using R
# Let's use R

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install
library(package = "car")

####import data####
#name the dataset sleep
sleep <- 
  
#check data types of variables
str()

<-as.factor()

####assumptions####
#1. this is nominal data
#2. minimum of 5 observations in each category

summary()

#are these assumptions met? 

####create a table####
## First, create a table of recall (did recall, did not recall, unsure)
#observed_DV <- table(df$DV)
observed_dream <- table()
#this table contains our observed count of participants

####conduct chi square goodness of fit test####
#To do this, we need to input our observed N and expected distribution
#chisq.test(observed_DV, p=c(expected_proportion_category1, expected_proportion_category2, expected_proportion_category3)) 

chisq.test(, p=c(, , .)) 
#make sure that the values you input for expected proportions align with the appropriate category
#you can see the order of the categories by printing your table

#What is the test statistic value? 
#What is our p-value? 
#Do we reject or fail to reject the null hypothesis? 

###voting example###
#We collected data on whether or not people voted to approve a go green policy. Specifically we wanted to know if the votes seemed to differ from a random selection to Approve or Not Approve.
#What proportions of votes would we expect for each choice if people selected at random?
#conduct a Chi-Square Goodness of Fit test to test this using the "vote" data

