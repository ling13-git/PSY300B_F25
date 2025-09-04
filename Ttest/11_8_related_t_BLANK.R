###Related Sample T-test###

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install
library(package = "car")

####import data####
read <- read.csv("~/Workspace/PSY300B/PSY300B_F25/privitera_infocus/11_8_related_t.csv") #In the Environment window, Import > From Text (base) > Select File > Name the file whatever you want. Copy and paste the line of code from the Console window.

#check data types of the variables
str()

#where is the IV in this data?
#wide vs. long format for data

####evaluate assumptions####

#####normality#####
#skewness
#kurtosis
#when there are different measures of the DV, we want to calculate separately for each instance of measurement
describe(read$present, type = 2) #use type 2 to match SPSS output
describe(read$absent, type = 2)

print (describe(, type = 2), digits = 3) 
print (describe(, type = 2), digits = 3)

#skewness within +/- 1.0 
#kurtosis within +/- 2.0

#does each group pass normality for skewness? kurtosis?

#Shapiro-Wilk test for normality
#conduct separately for each measurement of the DV

#shapiro-wilk test on each group/DV
#shaprio.test(df$DV)
shapiro.test(read$present)
shapiro.test()

#do both groups pass Shapiro-Wilk test?

####compute related sample t-test####
#t.test(x = df$DV1,
#       y = df$DV2,
#       paired = TRUE) #indicates that each row represents data from one participant, so the data in that row should be paired

t.test(x = ,
       y = ,
       paired = TRUE)
#confidence interval included in output

#Cohen's D effect size
#cohensD(x = df$dv1,
#        y = df$dv2,
#        method = "paired")

cohensD(x = read$present,
        y = read$absent,
        method = "paired")

#alternative way to calculate independent sample t-test
# pairedSampleTTest(formula = ~ dv1 + dv2, 
#                        data = df, 
#                        id = NULL, #use this is data is in long format
#                        one.sided = FALSE, 
#                        conf.level = 0.95)

pairedSamplesTTest(formula = ~ ,
                  data = , 
                  id = NULL,
                  one.sided = FALSE, 
                  conf.level = 0.95)

####visualize data####
#histogram of the difference scores

#df$diff <= df$DV1 - df$DFV2

read$diff <- read$ - read$ #what we are really doing with the related-samples t-test is seeing if the difference scores differ from 0

diff.histo <- ggplot(data = read, mapping = aes(x = diff)) + #data = df, x = difference score
  geom_histogram(bins = 10,
                 fill = "red",
                 color = "white") +
  theme_apa() + 
  labs(title = "Histogram of difference (mins) when teacher present vs. absent", #update titles as appropriate
       x = "Difference in Minutes (Present - Absent)",
       y = "Participants")

#try it - another example
#import meals_related data
#does the time in the semester change the amount of meal swipes people use?
#what would you conclude and why?
