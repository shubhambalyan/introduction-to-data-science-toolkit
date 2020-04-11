# R Basics - Dataset
# Concatenating dataset in R
data.1 = c(23,14,5,67,89) #Spaces are ignored
data.1
#[1] 23 14  5 67 89

# Summary of dataset
summary(data.1)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#5.0    14.0    23.0    39.6    67.0    89.0 

mean(data.1) # 39.6
sum(data.1)/5 # 39.6

#Standard Deviation
sd(data.1) # 36.46642