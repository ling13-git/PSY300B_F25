###Independent-Sample T-test###

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install
library(package = "car")

####import data####
buffet <- read.csv("~/Workspace/PSY300B/PSY300B_F25/privitera_infocus/10_8_independent_t.csv") #In the Environment window, Import > From Text (base) > Select File > Name the file whatever you want. Copy and paste the line of code from the Console window.

#check data types of the variables
str()

#convert to factor
#df$DV <- as.factor(fd$DV)
buffet$groups <- as.factor(buffet$groups)

####evaluate assumptions####

#####normality#####
#skewness
#kurtosis
#when there are different groups, we want to calculate separately for each group
#describeBy(df$DV, group = df$IV)
describeBy(, group = ) #not match SPSS
print (describeBy(, group = , type = 2), digits = 3) #view skew and kurtosis information in those columns, matches SPSS

#skewness within +/- 1.0 
#kurtosis within +/- 2.0

#does each group pass normality for skewness? kurtosis?

#Shapiro-Wilk test for normality
#conduct separately for each group
#break up data into two groups, one for each level

#df_subset <- filter(df, IV == "IVlevel")
slowly <- filter(, groups == "") #filters data to only include relevant rows of data based on the criteria. Puts this subset of data in a new dataframe, which you name.
fast <- filter(, groups == "")

#shapiro-wilk test on each group
#shapiro.test(df_subset$DV)
shapiro.test()
shapiro.test()

#do both groups pass Shapiro-Wilk test?

####Equality of variances####
#Levene's test
#leveneTest(y = DV ~ IV, data = df)
#null is equality of variances, alternative is not equality of variances
leveneTest(y =  ~ , center = mean, data = ) #the default is to center this metric around the median, we want to center around the mean to match SPSS output from your book

####compute independent sample t-test####
#t.test(formula = data$DV ~ data$IV, var.equal = TRUE)
t.test(formula =  ~ , var.equal = TRUE) #conducts and returns results of an independent sample t-test assuming the variances are equal (what the Levene test tested for), otherwise the default is to use Welch's which does not assume equal variance
#confidence interval included in output

#Cohen's D effect size
#cohensD(x = DV ~ IV,
#        data = df,
#        method = "pooled") #use pooled if assumption of equal variances is met

cohensD(x = ,
        data = ,
        method = "pooled")

#alternative way to calculate independent sample t-test
#same output as indepdent samples t-test and cohen's D test
# independentSampleTTest(DV ~ IV, 
#                        data = df, 
#                        var.equal = TRUE,
#                        one.sided = FALSE, 
#                        conf.level = 0.95)

independentSamplesTTest(,
                        data = ,
                        var.equal = TRUE,
                        one.sided = FALSE,
                        conf.level = 0.95)

####visualize data####

#histograms of each group 
intake.histo <- ggplot(data = buffet, mapping = aes(x = intake)) +
  
  geom_histogram(bins = 10, 
                 fill = "#7463AC",
                 color = "white") +
  
  facet_grid(cols = vars(groups), #use the groups in variable groups for the different panels
             labeller = as_labeller(c(fast = "Fast", slowly = "Slowly"))) + #relabel the different panels with formatted names
  
  theme_apa() + 
  
  labs(title = "Histogram of calorie intake by eating speed",
       x = "Calorie intake",
       y = "Participants")

#bar graph comparing the two groups with error bars

# data.plot <- data.frame(
#  Group = c("Group A", "Group B"),
#  Mean = c(mean.t1, mean.t2),
#  sem = c(SEM.t1, SEM.t2)
# )

#get the data from the earlier descriptive statistics you looked at
#what do you run to get these descriptive statistics?

#to modify this for future graphs, just change the values for Mean and sem in the below dataframe
buffet.data.plot <- data.frame(
  Group = c("Fast", "Slowly"),
  Mean = c(650, 600),
  sem = c(53.229, 63.246)
)

intake.bar <- ggplot(data = buffet.data.plot) + 
                    geom_bar(aes(x = Group, y = Mean), 
                             stat = "identity", 
                             fill = c("red", "blue"),
                             color = "white") +
                    geom_errorbar(aes(x = Group, ymin = Mean - sem, ymax = Mean + sem), 
                                  width = .2) +
             theme_apa() + 
             labs(title = "Mean calorie intake by eating speed",
                  x = "Eating speed",
                  y = "Mean calorie intake")


####meal example####
#do people in rusk differ from sig ep in number of meal swipes used per week?
#20 random rusk members and 20 random sig ep members report number of meal swipes they use in a week
#in data file "meals"

#run an independent samples t-test
#what would you conclude?
#what would you write up in APA style?