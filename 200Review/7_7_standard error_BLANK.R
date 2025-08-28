####Standard Error of the Mean####
#Privitera 7.7
#this maps to example 7.7 (SPSS In Focus: Estimating the Standard Error of the Mean) from the Privitera textbook

####packages####
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install

####import data####
#this dataset looks at firefighters' reaction times (in sec) to emergency calls
#the data set is in the folder "200Review". you see that one folder and file now. Dr. Ng will add more to your folder(s) as we go through more content. Each time you click the link to JupyterLab in our Moodle page, you JupyterLab will refresh with any new documents Dr. Ng has added.
#import and name the dataset call
#import dataset > from text (base) > find dataset and select, change the name to "call" and click import
#look at the output line in the console. copy and paste this line of code below, so you can run it without doing point and click in the future



#check data types of the variables
#if a variable is a ratio/interval number scale, we want it classified as an "int" (integer) or "num" (numeric) data type
str()

####saving your file####
#top bar > file > Save As
#make sure to attend to where you are saving your file

####descriptive statistics####
#describe(df$DV) #look at a number of descriptive statistics for a variable
describe()

#describe(df$DV, type = 2) #uses type 2 SS calculations - to match SPSS skew and kurtosis statistics
describe(, type = 2)

#print(describe(df$DV, type = 2), digits = 3) #round to 3 digits
print(describe(, type = 2), digits = 3)

#where is the standard error of the mean reported?

#how do we get the standard error of the mean? SD/sqrt (n)
#sd(df$DV)/sqrt(n)

#what is n here?

sd()/sqrt()

#does our calculation match the calculation from the describe function?

####exporting your file####
#bottom right window > check box for relevant file(s) > more > export
#make sure to attend to where you are saving your file

####importing a file####
#bottom right window > upload

#Important Note: Think of JupyterLab as a cloud-based system similar to Googledrive. JupyterLab and your local folders/files on your computer do not naturally communicate. If a file lives on JupyterLab and you want to use it on your local computer, you must export it. If a file lives on your local computer and you want to use it in JupyterLab, you must upload it in JupyterLab. If you make changes to a file in one place (JupyterLab or your local computer), it will not automatically sync between copies in JupyterLab and your local computer.