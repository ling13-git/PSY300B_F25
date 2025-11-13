####Non-Parametric Ordinal Tests####
#packages
library(package = "psych")
library(package = "lsr") 
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") 
library(package = "car")
library(package = "sciplot") 
library(package = "performance") l
library(package = "lmtest") 
library("BSDA") #likely need to install

####One Sample Sign Test####
#tests whether the median rather than mean is equal to some number
#fail when data is not normal

#import data
athlete 

#check structure
str()

#descriptive statistics - attend to the median
describe(, type=2)

#check if data is normal. if normal, do a one-sample t-test
shapiro.test() #is normal

#statistical test
#SIGN.test(x = df$DV, md = population median)
SIGN.test(x = , md = 28.3)

####Wilcoxon Sign Ranks T Test####
#Hypothesis: People will like a new art installment in their community less the first time they see it than after one year of exposure.
#DV: Ratings from 1 (dislike very much) to 7 (like very much).

#import data
art 

#check structure
str()

#descriptive statistics
describe(, type=2)

#check if data is normal - if so, do a related samples t-test
shapiro.test()
shapiro.test()

#statistical test
# wilcox.test(x = df$DV(Condition1),
#             y = df$DV(Condition2),
#             paired = TRUE, #stays constant
#             exact = FALSE) #stays constant

wilcox.test(x = ,
            y = ,
            paired = TRUE,
            exact = FALSE)

####Mann-Whitney U Test####
#aka  Wilcoxon rank sum test
#Hypothesis: Children wearing masks on Halloween will take more candy from unattended bowls than will children without masks.
#DV: Pieces of candy taken.

#import data
halloween 

#check structure
str()

 <- as.factor()

#descriptive statistics
describeBy(, group = halloween$costume, type = 2)

#check assumptions- if normal, do indpendent samples t-test
mask <- filter(, costume == "")
no_mask <- filter(, costume == "")

shapiro.test()
shapiro.test()

#statistical test
# DV.by.IV <- wilcox.test(formula = df$DV ~ df$IV,
#                                 paired = FALSE) #stays constant

candy.by.costume <- wilcox.test(formula = ,
                                paired = FALSE)

candy.by.costume

#look at median of each group to compare

####Kruskal Wallis H Test####
#Hypothesis: Girls' performance on a math exam will be affected by whether they hear a message that confirms or challenges the stereotype that women are bad at math.
#DV: Math exam scores from 0 to 100.

#import data
math <-
  
#check structure
str(math)

 <- as.factor()

#descriptive statistics 
describeBy(, group = math$condition, type = 2)

#check assumptions - normality - if normal, do one-way between subjects anova
 <- filter(, condition == "")
 <- filter(, condition == "")
 <- filter(, condition == "")

shapiro.test()
shapiro.test()
shapiro.test()

#statistical test
# DV.by.IV <- kruskal.test(formula = DV ~ IV,
#                                    data = df)

score.by.condition <- kruskal.test(formula = ,
                                     
                                     data = )
score.by.condition

####Friedman Test####
#Hypothesis: People will select more positive traits to describe themselves and a friend than a stranger.
#DV: Number of positive traits selected from a list of 100

#import data
description <- 
  
#check structure
str()

 <- as.factor()

#descriptive statistics
describeBy(, group=description$person,  type = 2)

#check  normality - if normal, do one-way within subjects anova
#subset into the types of people

shapiro.test()
shapiro.test()
shapiro.test()

#statistical test
#make sure your data is in long format (each row represents one data point)
# DV.by.IV <- friedman.test(formula = DV ~ IV | participant, #particpipant is the variable that contains a participant identification
#                                  data = df)

trait.by.person <- friedman.test(formula = ,
                                   data = )
trait.by.person 