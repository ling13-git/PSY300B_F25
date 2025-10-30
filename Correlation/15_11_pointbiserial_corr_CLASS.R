##### Point Biserial Correlation Coefficient ####

####install packages####
library("psych")
library("car")
library("ltm")

# import data
#name humor

# check structure
str()

#convert sex to factor
 <- as.factor()

#### Assumptions####
## Normality Assumption for continuous variable
describe(, type=2)
shapiro.test()

## Equal Variances Assumption for dichotomous variable

#to run
#leveneTest(DV ~ IV, data = df)
leveneTest( ~ , data = )

#### Point Biserial Correlation ####
#to run a correlation we need to code our factor variable as a numeric
#df$DVN <- as.numeric(df$DV)
humor$sexN <- as.numeric(humor$sex)

#cor.test(df$DV1N, df$DV2, method=c("pearson"),
#         alternative=c("two.sided"), conf.level=.95)

cor.test(, , method=c("pearson"),
         alternative=c("two.sided"), conf.level=.95)

# What is effect size? 
#r^2

####Visualize####
plot(, , main='Scatter Plot of Sex of Comedian and Duration of Laughter (s)', xlab='Sex of Comedian', ylab='Duration of Laughter (s)')