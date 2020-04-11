# Basic Inferential Statistics - Hypothesis Testing

# The Gossett Data - 2 Drugs and 10 Patients
# Box Plot
plot(extra~group, data = sleep, main = "Extra Sleep by Group")
attach(sleep)
extra.1 = extra[group==1]
extra.2 = extra[group==2]

# Test your Hypothesis

t.test(extra.1, extra.2, paired = TRUE, alternative = "two.sided")

# data:  extra.1 and extra.2
# t = -4.0621, df = 9, p-value = 0.002833
# alternative hypothesis: true difference in means is not equal to 0 - RESULT

# 95 percent confidence interval:
#  -2.4598858 -0.7001142
# sample estimates:
#  mean of the differences 
# -1.58

# H0: mean response is the same for both the drugs
# H1: mean response is not the same for both the drugs

# p-value: 2*pt(-4.0621, 9) if p < alpha -> reject
# alpha: level of significance

# Get the table value 
qt(0.975, 9)
