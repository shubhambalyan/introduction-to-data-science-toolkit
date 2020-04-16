# ARMA Models

# Discoveries dataset

plot(discoveries, main = 'Time Series from 1860 to 1959')

# Discrete Data
stripchart(discoveries, method = "stack", offset = 0.5, at = 0.15, pch = 19, main = 'Dotplot')

# ARMA tails off in both ACF and PACF
# AR(p) tails off in ACF and cuts off after lag p in PACF
# MA(q) cuts off after lag q in ACF and tails off in PACF

# Tails off in acf as well as in pacf
acf(discoveries, main = 'ACF')
acf(discoveries, type = 'partial', main = 'PACF')

# Order is 1
arima(discoveries, order = c(1,0,1))

# Auto ARIMA(2,0,0) - 2nd order model
install.packages("forecast")
library(forecast)
auto.arima(discoveries, d=0, approximation=FALSE)
