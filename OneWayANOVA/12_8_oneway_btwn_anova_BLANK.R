###One-way Between Subjects ANOVA###
#section 12.8

###packages###
install.packages("semTools")
library("semTools")
install.packages("car")
library("car")
install.packages("effectsize")
library("effectsize")
install.packages("MOTE")
library("MOTE")
library("psych")
library("apaTables") #likely need to install
library("ggplot2")

###import data###
#name exerise
exercise <- 

#check structure/data type of variables
str()

#covert to factor
exercise$<- as.factor()

####evaluate assumptions####

#####normality#####
#skewness
#kurtosis
#when there are different groups, we want to calculate separately for each group

## Check skewness (distribution symmetry) and kurtosis (peakedness of distribution) of each group
print(describeBy(, group = exercise$groups, type = 2), digits = 3)

#skewness within +/- 1.0 
#kurtosis within +/- 2.0

#does each group pass normality for skewness? kurtosis?

## Check using Shapiro-Wilk test of normality
<- filter(exercise, groups == )
<- filter(exercise, groups == "")
<- filter(exercise, groups == "")

#shapiro.test(df_IVlevel$DV)

shapiro.test(low$)
shapiro.test(moderate$)
shapiro.test(control$)

#do all groups pass Shapiro-Wilk test?

####homogeneity of variance####
#Levene's test
#leveneTest(y = DV ~ IV, data = df)
leveneTest(y =  ~ , center = mean, data = )

## Report Shapiro-Wilk stat for each exercise level.

### Do the skewness, kurtosis, and Shapiro-Wilk test suggest a normal distribution for the three levels? 

## Test Homogeneity of Variance Assumption
## Levene's test: Null hypothesis is that variances are equal
## If we reject the null, hypothesis, there is evidence that this assumption is violated (variances are NOT equal)

#leveneTest(DV ~ IV, data = df)
leveneTest( ~ , data = )

### Does Levene Test support or reject the null hypothesis? 

####One-way Between-Subjects ANOVA####
## Now, we compute one-way ANOVA
#aov(DV ~ IV, data = df)

results.aov <- aov( ~ , data = )
summary(results.aov)

#effect size
#eta squared
#etaSquared(results)
effsize <-  etaSquared()
effsize #partial and eta squared will be equal

####post-hoc test####
#we know there is a difference between means, but between which means?
#posthocPairwiseT(x = results, p.adjust.method = "holm")

post.hocs <- posthocPairwiseT(x = , p.adjust.method = "holm" )
post.hocs

#the values are p values comparing groups. if p < .05 it is a significant difference. you can the look at means to see the direction of the difference.

# Is difference between low and moderate intensity significant? 
# Is difference between low and control significant? 
# Is difference between moderate and control significant? 

### Ultimately, what between groups difference is driving the finding that there is a significant difference between group means?

####graphing results####
#create a bar graph that compares the means across the levels of the IV

#pull out the M and SEM from the descriptive statistics

mean_control <- 1.491
mean_low <- 1.054
mean_moderate <- 1.90

sem_control <- 0.471
sem_low <- 0.333
sem_moderate <- 0.314

#enter the data into a data.frame to be graphed
#data.plot <- data.frame(
#  Group = c("Level1", "Level2", "Level3"), #group names
#  Mean = c(mean_Level1, mean_Level2, mean_Level3), #means
#  sem = c(sem_Level1, sem_Level2, sem_Level3))) #standard errors


exercise.data.plot <- data.frame(
  Group = c("Control", "Low", "Moderate"),
  Mean = c(mean_control, mean_low, mean_moderate),
  sem = c(sem_control, sem_low, sem_moderate))

#now use that data.frame to create a graph
# DV.bar <- ggplot(data = data.plot) + #update name of dataframe
#   geom_bar(aes(x = Group, y = Mean), #keep these constant to refer to the groups and means you entered in your data.plot
#            stat = "identity", #keep this constant
#            fill = c("red", "blue", "green"), #specify the colors for the bars. you can update to change colors, or add to the list if there are more than 3 levels
#            color = "white") + #specify the color between bars
#   geom_errorbar(aes(x = Group, ymin = Mean - sem, ymax = Mean + sem), #specify the formula for the error bars, pulling the means and SEMs you entered into data.plot
#                 width = .2) +
#   theme_apa() + #use apa style
#   labs(title = "Title", #title for the graph - update
#        x = "X-axis label", #label for x axis - update
#        y = "Y-axis label") #label for y axis - update


mood.bar <- ggplot(data = exercise.data.plot) +
  geom_bar(aes(x = Group, y = Mean),
           stat = "identity", 
           fill = c("red", "blue", "green"),
           color = "white") +
  geom_errorbar(aes(x = Group, ymin = Mean - sem, ymax = Mean + sem), 
                width = .2) +
  theme_apa() +
  labs(title = "",
       x = "",
       y = "")

####Table of aov results and descriptive statistics####

#create an ANOVA table
# onewaybtwn.aov.table <- apa.aov.table(results.aov, #tells R to create an anova table based on your anova results. may need to update name of anova results
#                                       table.number = 0) #number you want to give to the table

onewaybtwn.aov.table <- apa.aov.table(,
                        table.number = 0)
onewaybtwn.aov.table

#you can also print these tables to a word doc outside of R

#see what your working directory is - this will be where the file will print to

getwd()

onewaybtwn.aov.table <- apa.aov.table(,
                                      table.number = 0,
                                      filename = "onewaybtwn.aov.table.doc") #set the name for the file - must end in .doc


#create a table of means and standard deviations
onewaybtwn.MSD.table <- apa.1way.table(iv = ,
                         dv =,
                         data = , 
                         table.number = 0,
                         filename = "onewaybtwn.MSD.table.doc")
onewaybtwn.MSD.table



