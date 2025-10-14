###Two-Way Between Subjects Factorial ANOVA###
#*this is for balanced designs (equal number of participants in each cell)- it is a bit more complicated for unbalanced designs (unequal number of participants in each cell)

###packages###
#if any are not installed, install them
library("psych")
library("lsr") # will likely need to install
library("ggplot2")
library("tidyverse")
library("jtools") #will likely need to install
library("car")
library("sciplot") #will likely need to install
library("rstatix")
library("apaTables")

####import data####
#name nudge

#check data types of the variables
str()

#convert any factor variables to factor
nudge$ <- as.factor(nudge$)
nudge$ <- as.factor(nudge$)

####evaluate assumptions####

#####normality#####
#skewness
#kurtosis
#check separately for each of the levels of each of the IVs

#eco variable
print(describeBy(nudge$items, group = , type = 2), digits = 3) #type 2 makes output match SPSS, print 3 digits after decimal place

#signage variable
print(describeBy(nudge$items, group = , type = 2), digits = 3)

#view skew and kurtosis information in those columns, matches SPSS

#skewness within +/- 1.0 
#kurtosis within +/- 2.0

#does each variable and group pass normality for skewness? kurtosis?

#Shapiro-Wilk test for normality
#conduct separately for each IV
#conduct separately for each group
#break up data into groups for levels

#shapiro-wilk test on each IV
#eco variable
high <- filter(nudge, eco == "")
modest <- filter(nudge, eco == "")

shapiro.test(high$)
shapiro.test(modest$)

#signage variable
none <- filter(nudge, signage == "")
recycle <- filter(nudge, signage == "")

shapiro.test(none$)
shapiro.test(recycle$)

#do all groups pass Shapiro-Wilk test? (p > .05)

#####Equality of error variances#####
#Levene's test
#leveneTest(y = DV ~ IV1 * IV2, data = df)
leveneTest(y = items ~  * , center = mean, data = ) #the default is to center this metric around the median, we want to center around the mean to match SPSS output from your book

#does this pass Levene's test? (p > .05)

####Compute two-way between-subjects omnibus ANOVA####
#Type III SS to match SPSS
#options(contrasts = c("contr.sum", "contr.poly")) #this row sets up contrasts to give us the correct sum of squares
#DV.aov <- lm(formula = DV ~ IV1 + IV2 + IV1:IV2,
#                data = df)
#Anova(DV.aov, type = 3)

options(contrasts = c("contr.sum", "contr.poly")) 
nudge.aov <- lm(formula =  ~  +  + , #creates linear model and puts into an object
                 data = )

Anova(nudge.aov, type = 3) #runs anova on the linear model object, using type III SS

#effect size
etaSquared(, type = 3) #type - specify type III SS
#we will use eta-sqaured to align with you book, though some use partial eta squared

####post-hoc tests####
#for a significant interaction, conduct simple main effects tests by splitting the data and conducting one-way ANOVAs

#before choosing which way to do simple effects, it can help to graph your data to make sense of it
#split up data - just look at one level of one IV

#first, i can do this by splitting by eco level

high <- filter(nudge, eco=="")
modest <- filter(nudge, eco=="")

#now conduct one-way anovas on each level (you could also do a t-test if there's two levels, but if there are more than 2 you need to do an anova so i'll model that here)

#is there an effect of signage on items for those high in eco-consciousness?
results.aov1 <- aov( ~ signage, data = high)
summary()

#is there an effect of signage on items for those low in eco-consciousness?
results.aov2 <- aov( ~ signage, data = modest)
summary()

#effect size for simple main effects
#eta squared
#etaSquared(results)
effsize <-  etaSquared(results.aov2)
effsize #use eta squared 

#for a post-hoc on a significant main effect, you want to follow this up with pairwise comparisons. 
#if there are only 2 levels, you do not need to do this because we know where the difference lies.
#if there are more than 2 levels, you must conduct posthocs.
#i will model here with the main effect for eco, even though there are only 2 levels.

pairwise.t.test(x = nudge$, #IV here
                g = nudge$, #DV here
                p.adjust.method = "holm")


####visualize data####
#not using ggplot, but another graphing package, sciplot
#lineplot of the data

#lineplot.CI(data = df,
#            x.factor = IV1,
#            response = DV,
#            group = IV2,
#            xlab = "x-axis label",
#            ylab = "y-axis label")

lineplot.CI(data = ,
            x.factor = ,
            response = ,
            group = ,
            xlab = "Eco-Consciousness",
            ylab = "Items Recycled" )
#dot represents mean of the cell
#error bars represent mean +/- standard error of the mean

#can flip which variable is the x-axis and grouping variable to visualize the data in a different way
lineplot.CI( x.factor = ,
             response = ,
             group = ,
             xlab = "Signage",
             ylab = "Items Recycled" )


####tables####

twoway.MSD.table <- apa.2way.table(iv1 = ,
                                   iv2 = ,
                                   dv = ,
                                   data = , 
                                   table.number = 0,
                                   filename = "nudge.twoway.MSD.table.doc") #make sure to use the "" and .doc at the end to print this
twoway.MSD.table

getwd()
