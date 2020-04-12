# Time Series Introduction - Time Plots

install.packages("astsa")
data(package = 'astsa')

# J&J Quarterly Earnings - already a time series data
require(astsa)

# Plotting the data 
plot(jj, type = 'o', main = 'J&J Earnings', ylab = 'Earnings', xlab = 'Years')

# Pneumonia and influenza deaths in US plot - already a time series
plot(flu, type = 'o', main = 'Monthly Deaths', ylab = 'Deaths', xlab = 'Months')

# Land Ocean temperatue
plot(globtemp, type = 'o', main = 'Land Ocean Temp', ylab = 'Temperature', xlab = 'Years')

# Land Only Temperature
plot(globtempl, type = 'o', main = 'Land Only Temp', ylab = 'Temperature', xlab = 'Years')

# variable Star Data
plot(star, main = 'Magnitude of Star for 600 Days', ylab = 'Magnitude', xlab = 'Days')

# Stationarity (Weak) - No systematic change in mean and variance (No Trend) and No periodic fluctuations

# Create normally distributed random numbers using rnorm()
random_process = ts(rnorm(10))
print(random_process)

#Time Series:
#  Start = 1 
#End = 10 
#Frequency = 1 
#[1] -1.7287839 -0.9912610 -0.5855056  0.3835217  0.7466649 -0.9284209 -0.3381763
#[8]  1.5451140  0.2665089  0.2995339

# Autocovariance function
(acf(random_process, type = 'covariance'))

# The above code gives a plot and the following data at different lags
#Autocovariances of series 'random_process', by lag

#0       1       2       3       4       5       6       7       8       9 
#0.8366  0.1941 -0.1401 -0.0256  0.0246  0.1273 -0.1070 -0.3217 -0.1009 -0.0690 

# Autocorrelation function - always start at 1 since r0 = c0/c0 = 1
acf(random_process, main = "Correlogram")

# There is no correlation as the data generated in random
(acf(random_process, main = "Correlogram"))

#Autocorrelations of series 'random_process', by lag

# 0      1      2      3      4      5      6      7      8      9 
# 1.000  0.232 -0.168 -0.031  0.029  0.152 -0.128 -0.384 -0.121 -0.083