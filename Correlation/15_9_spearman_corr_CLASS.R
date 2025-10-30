##### Spearman Correlation Coefficient ####

####install packages####
library("psych")
library("car")

# import data
#name mice

# check structure
str()

#### Assumptions ####

#monotonic relationship

## Assumption that two variable have a monotonic relationship
# We can test this with a scatterplot matrix 

plot(, , main='Scatter Plot', xlab='Food', ylab='Water')


## Test
#cor.test(df$DV1, df$DV2, method = c("spearman"), #specifies variables, type of correlation
#         alternative = c("two.sided"), conf.level = .95) #specified two sided test, alpha level

cor.test(, , method = c("spearman"),
         alternative = c("two.sided"), conf.level = .95)

# The error message is telling us that there are tied ranks, which Spearman isn't always great with.
# We can set the exact argument to FALSE to correct for this

cor.test(, , method=c("spearman"),
         alternative = c("two.sided"), conf.level = .95, exact = F)

####visualize####
#scatterplot of variables
plot(, , main='Scatter Plot of Food Rank and Water Rank', xlab='Food Rank', ylab='Water Rank')




