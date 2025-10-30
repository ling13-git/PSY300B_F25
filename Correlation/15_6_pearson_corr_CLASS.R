##### Pearson Correlation Coefficient ####

####install packages####
install.packages("psych")
library("psych")
install.packages("car")
library("car")

# import data
health 

# check structure
str()

#### Assumptions ####

## Assumption of Normality
#describe(df, type = 2)
describe(, type = 2)

#shapiro.test(df$Dv)
shapiro.test()
shapiro.test()

# can also do qq plot (quantile quantile plot). if points are pretty much on straight line, this indicates normality
# this plot compares theoretical quantiles (of a theoretical normal distribution) with the sample quantiles
# if the theoretical and sample quantiles are similar, they'll fall closely along the qq line, indicating normality
#qqnorm(df$DV)
#qqline(df$DV)

qqnorm()
qqline()

qqnorm()
qqline()

## Assumptions of Homoscedasticity and Linearity

# For linearity, we expect graph to be approximately linear
plot(health$, health$, main='Scatter Plot for Linearity Check', xlab='Mood', ylab='Eating')

#model <- lm(DV ~ IV, data = df)
model <- lm( ~ , data = )
abline()

# For homoscedasticity, we expect the variability of data points to be similar as we move away from the y-axis; in other words, we expect the variability of data points to have a similar (homo) variance or scatter (scedasticity) along the regression line (x-axis).
# For linearity, we also expect data points to be randomly dispersed around the regression line (x-axis); data points should not show nonlinear patterns. 
# in this case, we plot the residuals
# residual = sample datapoint - predicted datapoint

residuals <- resid() #resid(model)
fitted_values <- fitted() #fitted(model)

plot(fitted_values, residuals, xlab='Fitted Values', ylab='Residuals', main='Residual Plot')
abline(h=0, col='red')

####outliers####

#boxplot(df$DV, main='Title')

boxplot(, main='Boxplot Mood')
boxplot(, main='Boxplot Eating')

####Pearson correlation
#cor.test(df$DV1, df$DV2, method=c("pearson"),
#         alternative=c("two.sided"), conf.level=.95)

cor.test(, , method=c("pearson"),
         alternative=c("two.sided"), conf.level=.95)

# What is effect size (coefficient of determination)? 
# square the r

####visualize with graphing####
#use the same plot as before 

plot(, , main='Scatter Plot Mood and Calories Eaten with Line of Best Fit', xlab='Mood', ylab='Calories Eaten')

