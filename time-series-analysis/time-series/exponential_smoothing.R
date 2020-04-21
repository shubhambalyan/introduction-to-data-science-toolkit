# Forecasting using simple exponential smoothing

# London Rainfall Data
rain.data <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1)
rain.ts <- ts(rain.data, start=c(1813))

# Histogram and QQPlot
par(mfrow = c(1,2))
hist(rain.data, main="Annual London Rainfall 1813-1912",
     xlab="rainfall (in inches)")

qqnorm(rain.data,main="Normal Plot of London Rainfall")
qqline(rain.data)

# ACF Plot
par( mfrow=c(2,1) )
plot.ts(rain.ts, main="Annual London Rainfall 1813-1912",
        xlab="year", ylab="rainfall in inches")
acf(rain.ts, main="ACF: London Rainfall")

# Forecast
library(forecast)
auto.arima(rain.ts) # Result: ARIMA(0,0,0) = Nothing

# Exponential Smoothing Needed
alpha = 0.2 # increase alpha for more rapid decay
forecast.values = NULL # array to store forecast values
n = length(rain.data)

# First forecast
forecast.values [1] = rain.data[1]

# Create all forecast values
for( i in 1:n ) {
  forecast.values [i+1] = alpha*rain.data[i] + (1-alpha)* forecast.values [i]
}
paste("forecast for time",n+1," = ", forecast.values [n+1])
# "forecast for time 101  =  25.3094062064236"

# Holt-Winters exponential smoothing
HoltWinters(rain.ts, beta = FALSE, gamma = FALSE)

# -------------------- Double Exponent Smoothing ------------------

# Parameter alpha - level (simple)
# Parameter beta - trend (double)
# Parameter gamma - seasonal component (triple)

# forecast = level + trend

# -------------------- Triple Exponential Smoothing -----------------

# forecast = level + trend + seasonal : Additive seasonality
# forecast = ( level + trend ) * seasonal : Multiplicative seasonality

AirPassengers.hw <- HoltWinters(log10(AirPassengers))
AirPassengers.hw

# a: level and b: trend and s1-s12: seasonality

forecast(AirPassengers.hw)
plot(forecast(AirPassengers.hw))
