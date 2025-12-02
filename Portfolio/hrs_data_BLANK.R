####Working with HRS data###

####install packages
library(haven) #for reading .sav files
library(psych)
library(dplyr)
library(car)
library(lsr)
library(apaTables)
library(sciplot)

####Importing the Data###
#This data file is .sav file because that is the type of file HRS generates. We can still import this file, but this process is a bit different. Additionally, the data file is relatively large. The import process will look a bit different because of this.

#First you will need to download and the dataset on your device. It is a zipped file becuase it is so large. This means I cannot easily share it via github. Instead, you will download from Moodle, unzip the file, then upload it to JupyterLab. Second, you will unzip it for PC: https://support.microsoft.com/en-us/windows/zip-and-unzip-files-8d28fa72-f2f9-712f-67df-f80cf89fd4e5 or MAC: https://support.apple.com/guide/mac-help/zip-and-unzip-files-and-folders-on-mac-mchlp2528/mac. Third, you will upload the unzipped file to JupyterLab by going to Files > Portfolio > click Upload > Select file. 

#we need the haven package in order to import the data
#to import the data go to import datset > from SPSS > import
#if you are initially having issues importing the data, it is likely because the data file is relatively large. It may stall out trying to preview the data. To avoid this, you can copy and paste the text in the bottom righthand window when importing. After this is imported the first time, you should be able to run the code smoothly

#hrs <- read_sav("Portolio/hrs.sav") #the line of code for importing should look like this but with your file pathway

#name the dataset hrs for analyses
hrs <- read_sav("Portolio/hrs.sav") #copy and paste for importing
#15868 observations of 7062 variables
#note that there are labels for the variable names beneath the variable names. Variable names should align with the codebook

####identify your variables####

#look at HRS for what variabales I might want to consider. I am going to focus on ANOVA here. What types of variables do I want?

#I am an I/O Psychologist - I'm interested in work. Let's look at the employment section and the demographic section. 


#take a look at different potential variables of interest and their values

#my variables
#amount salary on the job SJ206 (continuous variable)
#college degree SB016 (categorical - 2 levels)
#family SES situation SB020 (categorical - 3 levels)

#from the codebook, I can tell that these would be appropriate variables for analysis

####select data####
#pull out those relevant variables to a smaller dataframe that is easier to work with

#choose relevant subset
#use select() to identify columns, subset() to identify rows with certain characteristics

#select the variables of interest
#subset <- select(df, V1, V2, V3)

job <- select()

####recode data####
#you may notice from the codebook, that each variable has different values associated with it

#recode variables of interest using ifelse statements. ifelse statements tell us that if our condition is met, we will assign one value and if our condition is not met, we will assign a different value

# > greater than
# < less than
# == is equal to
#NA is a value that will replace the current value with "NA" telling R that the data should be considered missing

#df$dvR <- ifelse(condition, 
#                 value if condition met, 
#                 value if condition not met)

#if you need to connect two conditions, you can do that with an &


job$SB016R <- ifelse()

summary(as.factor(job$SB016R)) #look at the result of recoding here. we do not want to convert to a factor before recoding because it may give us issues with recoding.

job$SB020R <- ifelse()

summary(as.factor(job$SB020R))

job$SJ206R <- ifelse()
describe(job$SJ206R)


####remove missing data####
#we need to remove any participants who have missing data
#df <-na.omit(df) #this will make it so only particicipants with complete data will be included. this will allow us to do our analyses, otherwise we will encounter an error. 
 <- na.omit()

table(, ) #see how many in each cell - likely unbalanced, that's ok.

####move on to anova test - this is the same as past ANOVAs####

####convert to factors####
#make appropriate variables factors
job$SB016R <- as.factor(job$SB016R)
job$SB020R <- as.factor(job$SB020R)

####descriptive statistics####
summary(job$SB016R)
summary(job$SBO20R)
describe(job$SJ206R)

#test for normality
describe(job$SJ206R)

#financial situation variable
#SB020R 1-well, 3-average, 5-poor
well <- filter(job, SB020R == "1")
average <- filter(job, SB020R == "3")
poor <- filter(job, SB020R == "5")

shapiro.test(well$SJ206R)
shapiro.test(average$SJ206R)
shapiro.test(poor$SJ206R)

#college degree variable
#SB016R 1-yes, 5-no
degree <- filter(job, SB016R == "1")
no_degree <- filter(job, SB016R == "5")

shapiro.test(degree$SJ206R)
shapiro.test(no_degree$SJ206R)

#Levene's test
leveneTest(y = SJ206R ~ SB020R * SB016R, center = mean, data = job)

#anova
options(contrasts = c("contr.sum", "contr.poly")) 
job.aov <- lm(formula = SJ206R ~ SB020R + SB016R + SB020R:SB016R, #creates linear model and puts into an object
              data = job)

Anova(job.aov, type = 3) #runs anova on the linear model object, using type III SS

#effect size
etaSquared(job.aov, type = 3) #type - specify type III SS


####visualize data####
#not using ggplot, but another graphing package, sciplot
#lineplot of the data

#lineplot.CI(data = df,
#            x.factor = IV1,
#            response = DV,
#            group = IV2,
#            xlab = "x-axis label",
#            ylab = "y-axis label")

lineplot.CI(data = job,
            x.factor = SB016R,
            response = SJ206R,
            group = SB020R,
            xlab = "Childhood SES",
            ylab = "College Degree" )
#dot represents mean of the cell
#error bars represent mean +/- standard error of the mean

#can flip which variable is the x-axis and grouping variable to visualize the data in a different way
lineplot.CI(data = job,
            x.factor = SB020R,
            response = SJ206R,
            group = SB016R,
            xlab = "College Degree",
            ylab = "Childhood SES" )

describeBy(nudge$items, nudge$eco_signageF)


####tables####
twoway.MSD.table <- apa.2way.table(iv1 = SB020R,
                                   iv2 = SB016R,
                                   dv = SJ206R,
                                   data = job, 
                                   show.marginal.means = TRUE,
                                   table.number = 0,
                                   filename = "job.twoway.MSD.table.doc") #make sure to use the "" and .doc at the end to print this
twoway.MSD.table

getwd()

