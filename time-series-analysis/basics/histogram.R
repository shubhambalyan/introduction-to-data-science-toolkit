# Histograms

small.size.dataset=c(91,49,76,112,97,42,70, 100, 8, 112, 95, 90, 78, 62, 56, 94, 65, 58, 109, 70, 109, 91, 71, 76, 68, 62, 134, 57, 83, 66)

# Change x-label and title
hist(small.size.dataset, xlab = "My Data Points", main = "Histogram")

# Frequency on y-axis
hist(small.size.dataset)

# Probability on y-axis
hist(small.size.dataset, xlab = "My Data Points", main = "Histogram", freq = F)

# Change color of bars
hist(small.size.dataset, xlab = "My Data Points", main = "Histogram", freq = F, col = 'green')

# Impose density functions
lines(density(small.size.dataset))

# Change color and line width of density function
lines(density(small.size.dataset), col = 'red', lwd = 5)

# Change bin width
hist(small.size.dataset, xlab = "My Data Points", main = "Histogram", freq = F, col = 'green', breaks = 10)
lines(density(small.size.dataset), col = 'red', lwd = 5)