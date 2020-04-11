# Linear Regression in R

# Mauna Loa CO2 Data - Oscillatory Data
plot(co2, main='Atmospheric CO2 Concentration')

# Response variable: CO2 concentration (linear model plus some noise)
# Assumptions: Errors
# 1. Errors are normally distributed
# 2. Errors have same variance
# 3. Errors are unrelated to each other (independent)

(co2.linear.model = lm(co2~time(co2))) # co2 on time (Response on Predictor)

#Coefficients:
#  (Intercept)    time(co2)  
#  -2249.774      1.307  

# Plotting the regression line
plot(co2, main='Atmospheric CO2 Concentration with Regression Line')
abline(co2.linear.model)

# Plotting the residuals: difference between the observed data of the dependent variable y and the fitted values y
co2.residuals = resid(co2.linear.model)
hist(co2.residuals, main = "Histogram of residuals")

# NOTE: Theoretically the sum of the residuals in a simple linear regression model is 0.

# Quantile Plot - Shows if data is normally distributed or not
qqnorm(co2.residuals)
qqline(co2.residuals)

# Time Plot
plot(co2.residuals~time(co2))
plot(co2.residuals~time(co2), xlim = c(1960,1963), main = "Zoomed Residuals")
