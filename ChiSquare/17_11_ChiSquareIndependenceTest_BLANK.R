####Chi Square Test of Independence####

## R In Focus: Chi Square Test of Independence
## Learning Objective: Compute the chi-square test for independence and evaluate assumptions using R

## First, return to example 17.2 (p. 739) of the textbook
## What are the 2 assumptions needed to compute a chi-square goodness-of-fit test? 

## Read through example 17.2 regarding the study on the effectiveness of individual and family counseling in different settings
## We hypothesize that patients will be more likely to complete therapy when family is involved in counseling rather than in individual therapy
## We measure the relation between type of counseling (family vs individual) and counseling outcome (completion vs premature termination)

## What is the null hypothesis? 
## What is the alternate hypothesis? 
## Have we met our 2 assumptions (what are they and how do you know we've met them)? 

## We can compute the test statistic by hand or by using R
## Let's use R

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install
library(package = "car")

####import data####
#name the dataset therapy

therapy <- 

#check data type of variables
str()

#convert appropriate variables to factor
therapy$ <- as.factor(therapy$)
therapy$ <- as.factor(therapy$)

####assumptions####
#1. this is nominal data
#2. minimum of 5 observations in each category


#are these assumptions met? the first is, we will check the second after running our chisq test

####conduct chi square test####

#create a table
#observed_IV1_IV2 <- table(df$IV1, df$IV2)
observed_counseling_outcome <- table(,)

#chisq.test(observed_table, correct = F) #leave as correct=F for any calculations
chisq.test()

## Note, these results do not converge with what we did by hand. 
## This is because the default in R is to do a continuity correction. 
## We don't want that, so we can make the argument false. 

chisq.results <- chisq.test(, correct=F) #put the results into an object
chisq.results

$expected #use this to get our expected frequencies. you can do use this same method to get expected frequencies when you are running a goodness of fit test, or just calculate by hand if it's easier.
$observed

#after getting the expected frequencies, is our assumption met?

#####calculate Cramer's V#####
#measure of effect size
#cramersV(observed_table)
cramersV(, correct = F) #leave as correct=F for any calculations

## What is the value of the test statistic? 
## What is the p-value? 
## Do we reject or fail to reject the null hypothesis? Why? 

#no visualization required for chisq

####housing example####
#I am interested in if a Davidson student's class year (junior or senior) is related to where they live (uphill or downhill). I think that more seniors will live down the hill and more juniors up the hill. 
#use the dataset housing to practice with another chisq test