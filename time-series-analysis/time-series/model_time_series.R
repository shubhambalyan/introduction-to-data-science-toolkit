# Modeling Time Series

# Random Walk: X(t) = x(t-1) + Z(t) ->  White Noise (Residual) and Normally Distributed

x = NULL
x[1] = 0
for(i in 2:1000){
  x[i] = x[i-1] + rnorm(1)
}

print(x)

# Transform data to time series
random_walk = ts(x)
plot(random_walk, main= "Random Walk", ylab = '', xlab="Days", col='blue')

acf(random_walk) # High Correlation is observed and no stationarity

plot(diff(random_walk)) # 999 data points. Used to remove the trend and introduce stationarity
acf(diff(random_walk))

# Moving Average Processes

# MA(2): Moving average model of order 2 -> We consider data from 2 days back
# MA(q): q days back model

# Generate Noise
noise = rnorm(10000)

ma_2 = NULL

# Generate MA(2) process - starting from 3 bcoz process depends on 2 days back
for (i in 3:10000) {
  ma_2[i] = noise[i] + 0.7*noise[i-1] + 0.2*noise[i-2]
}

# Shift data to left by 2 units
moving_average = ma_2[3:10000]

moving_average = ts(moving_average)

# Partition as a frame of 2 rows and 1 column for graphics only
par(mfrow = c(2,1))

#Plot
plot(moving_average, main = "Moving average process of order 2", col = 'blue')
acf(moving_average, main = "Corellogram of MA order 2")

# High correlation at lag 1 and some at lag 2 and then no correlation
# MA(2) will cut correlation after lag 2