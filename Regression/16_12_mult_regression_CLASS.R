####Multiple Linear Regression####

###packages###
#if any are not installed, install them
library(package = "psych")
library(package = "lsr") # will likely need to install
library(package = "ggplot2")
library(package = "tidyverse")
library(package = "jtools") #will likely need to install
library(package = "car")
library(package = "sciplot") #will likely need to install
library(package = "performance") #will likely need to install
library(package = "lmtest") #will likely need to install
library(package = "predict3d") #will likely need to download

####import data####
consumer 

#check data types of the variables
str()

####evaluate assumptions####
#for regression we check many of the assumptions after we run the model because we need to create the model object to test the assumptions

####normality#### 
#not a technical assumption, but we test anyways because if this is violated, we likely will violate elsewhere
#review descriptive statistics for each variable
print(describe(, type = 2), digits=3) #get an idea of M and SD for each variable

#shapiro-wilk test for each DV
#shapiro.test(df$DV)
shapiro.test()
shapiro.test()
shapiro.test()

#####linearity#####
# For linearity, we expect graph to be approximately linear
#look at two plots - one for each IV

#age
plot(, c, main='Scatter Plot for Linearity Check', xlab='', ylab='')

#DisIncome
plot(, , main='Scatter Plot for Linearity Check', xlab='', ylab='')

#*the rest of the assumptions, we will check after we run the model

####outliers####

#boxplot(df$DV, main='Title')

boxplot()
boxplot()
boxplot()

####Compute Linear Regression Model####
#reg.model <- lm(formula = DV ~ IV1 + IV2, 
#                data = df)

reg.model1 <- lm(, 
                data = )
summary(reg.model1)

#but we don't want a raw b, we want our betas
#reg.model.betas <- standardCoefs(reg.model)
reg.model.betas <- standardCoefs()
reg.model.betas

#what if we flip the order of IVs?
#should it matter/differ?

reg.model2 <- lm(, 
                data = )
summary(reg.model2)

#but we don't want a raw b, we want our betas
#reg.model.betas <- standardCoefs(reg.model)
reg.model.betas2 <- standardCoefs()
reg.model.betas2

#what if we looked at models with only one predictor - would the coefficients differ?

reg.model3 <- lm( ~ , #age
                 data = consumer)

reg.model4 <- lm( ~ , #income
                 data = consumer)

summary(reg.model1)
summary(reg.model2)
summary(reg.model3)
summary(reg.model4)


####Return to Assumption Check####

#function to check tests for the regression
check_model() #it's ok if this doesn't run

#####homoscedasticity#####
check_heteroscedasticity()

#####normality of errors#####
#Shapiro-Wilk test on residuals
check_normality()

#####independence of errors#####
#Durbin-Watson test
dwtest(formula = )

#####multicollinearity####
#Variance Inflation Factor
#graph scatterplot to see if IVs look related
plot(consumer$age, consumer$DisIncome) 

vif() #does this fall within threshold of 4?


####visualize data####
#it's difficult to visualize a multiple regression - many papers do not show a visual depiction

#one method is to look at separate regression graphs for each predictor with the DV. this is helpful, but doesn't depict both predictors at once.

reg.plot1 <- ggplot(, aes(x = , y = )) + #plot age and sales
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_apa() + 
  labs(title = "Linear Regression of Sales on Age",
       x = "Age",
       y = "Sales")
reg.plot1

reg.plot2 <- ggplot(consumer, aes(x = DisIncome, y = sales)) + #plot income and sales
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_apa() + 
  labs(title = "Linear Regression of Sales on Disposible Income",
       x = "Disposible Income",
       y = "Sales")
reg.plot2
