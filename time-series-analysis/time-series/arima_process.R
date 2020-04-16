# ARIMA(p,d,q) process - autoregressive integrated moving average
# d: no. of time we take the difference operator (1 or 2)

# Daily female births in California in 1959
library(astsa)

# read data to R variable
birth.data<-read.csv("C:/Users/Shubham Balyan/introduction-to-data-science-toolkit/time-series-analysis/time-series/daily-total-female-births-in-cal.csv")

# pull out number of births column
number_of_births<-birth.data$Daily.total.female.births.in.California..1959

# use date format for dates
birth.data$Date <- as.Date(birth.data$Date, "%m/%d/%Y")
plot.ts(number_of_births,main='Daily total female births in california, 1959', ylab = 'Number of births')

# Plot the differenced data
plot.ts(diff(number_of_births), main='Differenced series', ylab = '')

# Test for correlation
Box.test(number_of_births, lag = log(length(number_of_births)))

# Test for correlation in the differenced data
Box.test(diff(number_of_births), lag = log(length(diff(number_of_births))))

# acf and pacf of the differenced data

acf(diff(number_of_births), main='ACF of differenced data', 50)
pacf(diff(number_of_births), main='PACF of differenced data', 50)

# Fit various ARIMA models

# MA(1) for diff
model1<-arima(number_of_births, order=c(0,1,1))
SSE1<-sum(model1$residuals^2)
model1.test<-Box.test(model1$residuals, lag = log(length(model1$residuals)))

# MA(2)
model2<-arima(number_of_births, order=c(0,1,2))
SSE2<-sum(model2$residuals^2)
model2.test<-Box.test(model2$residuals, lag = log(length(model2$residuals)))

# ARIMA(7,1,1)
model3<-arima(number_of_births, order=c(7,1,1))
SSE3<-sum(model3$residuals^2)
model3.test<-Box.test(model3$residuals, lag = log(length(model3$residuals)))

# ARIMA(7,1,2)
model4<-arima(number_of_births, order=c(7,1,2))
SSE4<-sum(model4$residuals^2)
model4.test<-Box.test(model4$residuals, lag = log(length(model4$residuals)))

# Dataframe with AIC, SSE and p-value
df<-data.frame(row.names=c('AIC', 'SSE', 'p-value'), c(model1$aic, SSE1, model1.test$p.value), 
               c(model2$aic, SSE2, model2.test$p.value), c(model3$aic, SSE3, model3.test$p.value),
               c(model4$aic, SSE4, model4.test$p.value))
colnames(df)<-c('Arima(0,1,1)','Arima(0,1,2)', 'Arima(7,1,1)', 'Arima(7,1,2)')

# Display dataframe
format(df, scientific=FALSE)

# Observation from p-value: there is no autocorrelation, we cannot reject null hypothesis.
# Smallest AIC - ARIMA(0,1,2)

# Fitting ARIMA(0,1,2)
sarima(number_of_births, 0, 1, 2, 0, 0, 0)
