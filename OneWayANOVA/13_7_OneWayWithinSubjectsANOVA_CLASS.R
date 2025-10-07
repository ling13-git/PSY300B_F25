## Section 13.7
## R In Focus: The One-Way Within-Subjects ANOVA

## Learning Objective 13.7: Compute the one-way within subjects ANOVA, evaluate the assumptions, and select an appropriate post hoc test using SPSS. 

## Load Packages
library("semTools")
library("rstatix")
library("car")
library("effectsize")
library("multcomp")
library("emmeans")
library("MOTE")
library("psych")
library("apaTables") 
library("ggplot2")
library("tidyverse")
library("lsr")
library("car")
library("jtools")

## Read in Dataset 13.7

####import data####
#name the dataset wine
wine <- read.csv("~/Workspace/PSY300B/Ng Working Folder/One-Way ANOVA/13_7_oneway_within_anova.csv")

#review structure of data
str(wine)

#convert appropriate variables to factor
wine$cost <- as.factor(wine$cost)

####evaluate assumptions####

## One-Way Within-Subjects ANOVAs are parametric statistics
## The data must be on an interval or ratio scale of measurement

## Three Other Assumptions

## 1 Methodological: Independence within groups

## 2 Statistical: Normality and Sphericity

## Testing Normality of Dependent Variable
## Null Hypothesis: Data are normally distributed
## Alternative Hypothesis: Data are not normally distributed

#check skew and kurtosis with descriptives
print(describeBy(wine$rating, wine$cost, type = 2), digits = 3)

## Check using Shapiro-Wilk test of normality
#create subset for ratings at each cost level. are the ratings at each cost level normally distributed?

inexpensive <- filter(wine, cost == "inexpensive")
moderate <- filter(wine, cost == "moderate")
expensive <- filter(wine, cost == "expensive")

shapiro.test(inexpensive$rating)
shapiro.test(moderate$rating)
shapiro.test(expensive$rating)

## Do skewness, kurtosis, and Shapiro-Wilk tests of normality reject or fail to reject the null hypothesis? 
## Is assumption of normality supported? 

## Now, test assumption of sphericity
## We'll use Mauchly's test of sphericity
## Null Hypothesis: variances of the differences between all pairs of groups are equal
## Alternative Hypothesis: differences between all pairs of groups are not equal

#sphericity <- anova_test(data = df, dv = DV, wid = participant, within = IV)
#wid variable is the variable that specifies the participant identity. this could be a participant number, name, or other identifier. it will determine what lines of data are considered as belonging to the same participant
#within variable is the IV that is a within subjects variable

sphericity <- anova_test(data = wine, dv = rating, wid = participant, within = cost)
mauchly_results <- sphericity$`Mauchly's Test for Sphericity`
mauchly_results

## What is the p-value for Mauchly's test? 
## Do we reject or fail to reject the null hypothesis? 
## Is the assumption of sphericity met? 

####within-subjects ANOVA test####
#withinmodel <- anova_test (data = df, dv = DV, wid = participant, within = IV, effect.size = "pes")
#get_anova_table(withinmodel) #this prints the result of our anova as an anova table
#effect.size indicates the type of effect size to report with your data. this should not change. "pes" indicates partial eta squared

withinmodel <- anova_test(data = wine, dv = rating, wid = participant, within = cost, effect.size = "pes")
get_anova_table(withinmodel)

### Report degrees of freedom numerator and denominator
### Report test statistic (F)
### Report p-value
### Report Effect Sizes--value of partial eta-squared

####post hoc tests####
#bonferroni pairwise comparison t-tests
#pairwise.t.test(x = df$DV, 
#                g = df$IV, 
#                paired = TRUE, 
#                p.adjust.method = "holm")

pairwise.t.test(x = wine$rating, 
                g = wine$cost, 
                paired = TRUE, 
                p.adjust.method = "holm")

#could use bonferroni. this is a more intuitive adjustment method, but tends to be overly conservative.

pairwise.t.test(x = wine$rating, 
                g = wine$cost, 
                paired = TRUE, 
                p.adjust.method = "bonf")


####visualize####
#we will create a bar graph similar to our one-way between subjects anova

#get descriptive from our previous descriptive statistics
#first we create objects for our values
mean.inexpensive <- 3.0
mean.moderate <- 4.0
mean.expensive <- 6.0

sem.inexpensive <- .535
sem.moderate <- .436
sem.expensive <- .535

#then we put those objects into a data frame
wine.data.plot <- data.frame(
  Group = c("Inexpensive", "Moderate", "Expensive"),
  Mean = c(mean.inexpensive, mean.moderate, mean.expensive),
  sem = c(sem.inexpensive, sem.moderate, sem.expensive))


wine.bar <- ggplot(data = wine.data.plot) +
  geom_bar(aes(x = Group, y = Mean),
           stat = "identity", 
           fill = c("red", "blue", "green"),
           color = "white") +
  geom_errorbar(aes(x = Group, ymin = Mean - sem, ymax = Mean + sem), 
                width = .2) +
  theme_apa() +
  labs(title = "Mean wine rating by cost",
       x = "Cost",
       y = "Mean rating")

wine.bar

####tables####
#create a table of Ms and SDs by cost level
               
onewaywithin.MSD.table <- apa.1way.table(iv = cost,
                                       dv = rating,
                                       data = wine, 
                                       table.number = 0,
                                       filename = "onewaywithin.MSD.table.doc") #make sure to use the "" and .doc at the end to print this
onewaybtwn.MSD.table

getwd() #use this to see where the table will be printed to. update the formatting and copy and paste into your results