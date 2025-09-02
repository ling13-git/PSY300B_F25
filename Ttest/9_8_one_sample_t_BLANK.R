###One-Sample T-test###

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install

####import data####
care <- read.csv("~/Workspace/PSY300B/PSY300B_F25/privitera_infocus/9_8_one_sample_t.csv") #In the Environment window, Import > From Text (base) > Select File > Name the file whatever you want. Copy and paste the line of code from the Console window.

#check data types of the variables
str()

####evaluate assumptions####

#####normality#####
#skewness
#kurtosis
describe() #view skew and kurtosis information in those columns, do not match SPSS in book
describe(, type=2) #different method of calculating skew and kurtosis, matches SPSS, we will use this
print(describe(, type=2), digits=3) #change digits if want more decimal places
psych::describe(, type=2) #this tells R to specifically look to the package psych for the funciton describe. Sometimes there are multiple packages with functions with different names. R can get confused between the different functions with the same name.

#skewness within +/- 1.0 
#kurtosis within +/- 2.0

#does it pass normality for skewness? kurtosis?

#Shapiro-Wilk test for normality
#shapiro.test(df$DV)
shapiro.test() #null is that the distribution is normal. alternative is that it is not normal. 

#does it pass Shapiro-Wilk test?

####compute one-sample t-test####
#population mean is 77.43
#t.test(x = df$dv, mu = value)
t.test(x = , mu = )
#confidence interval included in output

#Cohen's D effect size
#cohensD(x = df$dv, mu = value)
cohensD(x = , mu = )

#alternative way to calculate one-sample t-test
#oneSampleTTest(df$dv, mu = value, one.sided = FALSE, conf.level = 0.95)
oneSampleTTest(, mu = 77.43, one.sided = FALSE, conf.level = 0.95) # this gives you the same result as the T-test and Cohen's D test, but in a different format

####visualize data####
#below we build up our visualization via histogram

health.histo1 <-  
  ggplot(data= care, 
         mapping = aes(x = health)) +
  
  geom_histogram() 
  

health.histo2<-  
  ggplot(data= care, 
         mapping = aes(x = health)) +
  
  geom_histogram() +
  
  theme_minimal() 


health.histo3<-  
  
  ggplot(data= care, 
         mapping = aes(x = health)) +
  
  geom_histogram() +
  
  theme_apa() 


health.histo4<-  
  
  ggplot(data = , 
         mapping = aes(x = )) +
  
  geom_histogram(binwidth = 5,
                 fill = "#7463AC",
                 color = "white") +
  
  theme_apa() +
  
  labs(title = "title",
       x = "x-axis",
       y = "y-axis")

#compare each histogram to see what is changing each iteration. 

#for geom_histogram, play around with binwidth, fill, and color. try changing theme_apa to theme_minimal. Try changing the title and labels for the axes under labs.

####meal example####
#on average a davidson student uses 10 meal swipes/week. do people in rusk differ from that?
#20 random rusk members report number of meal swipes they use in a week
#what's the null? alternative?

meals<-data.frame(rusk=c(0,5,10,3,0,6,12,10,3,9,0,1,14,8,7,2,20,0,10,12))

#run a one-sample t-test to look at this

#what can you conclude?

#how would you write this up in apa? look back at previous example from slides


