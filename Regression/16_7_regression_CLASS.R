####Simple Linear Regression####

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

####import data####
#name therapy

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

#####linearity#####
# For linearity, we expect graph to be approximately linear
plot(, , main='Scatter Plot for Linearity Check', xlab='Sessions', ylab='Symptoms')

#we can add a line for regression

#model <- lm(DV ~ IV, data = df)
model <- lm( ~ , data = therapy)
abline(model)

#function to check tests for the regression
check_model()

#####homoscedasticity#####
# For homoscedasticity, we expect the variability of data points to be similar as we move away from the y-axis; in other words, we expect the variability of data points to have a similar (homo) variance or scatter (scedasticity) along the regression line (x-axis).
# For linearity, we also expect data points to be randomly dispersed around the regression line (x-axis); data points should not show nonlinear patterns. 
# in this case, we plot the residuals
# residual = sample datapoint - predicted datapoint

residuals <- resid(model) #resid(model)
fitted_values <- fitted(model) #fitted(model)

plot(fitted_values, residuals, xlab='Fitted Values', ylab='Residuals', main='Residual Plot')
abline(h=0, col='red')

check_heteroscedasticity()

#####normality of errors#####
#Shapiro-Wilk test on residuals
check_normality()

#####independence of errors#####
#Durbin-Watson test
dwtest(formula = )

####outliers####

#boxplot(df$DV, main='Title')

boxplot(, main='Boxplot Sessions')
boxplot(, main='Boxplot Symptoms')

####Compute Linear Regression Model####
#reg.model <- lm(formula = DV ~ IV, 
#                data = df)

reg.model <- lm( ~ , 
                data = )

summary()

#coefficients section - estimate column gives the y intercept and slope of the regression line
#residual standard error = measure of the accuracy of predictions made using the regression


####visualize data####
# reg.plot <- ggplot(df, aes(x = IV, y = DV)) +
#   geom_point() + #remains constant
#   geom_smooth(method = lm , color="red", fill="#69b3a2", se=TRUE) + #remains constant
#   theme_apa() + #remains constant
#   labs(title = "Title", #update 
#        x = "X label", #update
#        y = "Y label") #update
# reg.plot

therapy.plot <- ggplot(, aes(x = , y = )) +
  geom_point() +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme_apa() + 
  labs(title = "Linear Regression of Symptoms of Sessions",
       x = "Sessions",
       y = "Symptoms")

therapy.plot