# Scatterplot for bivariate data

set.seed(2020) # For fixed randomness
# Generate normally distributed random numbers
Test_1_scores = round(rnorm(50, 78, 10)) # 50 students, 78 average, 14 standard deviation
Test_2_scores = round(rnorm(50, 70, 14))

Test_1_scores
#[1]  82  81  67  67  50  85  87  76  96  79  69  87  90
#[14]  74  77  96  95  48  55  79 100  89  81  77  86  80
#[27]  91  87  77  79  70  71  89 102  82  81  75  79  72
#[40]  82  87  73  75  71  66  81  74  78  85  83

Test_2_scores

#[1]  67  78  61  77  72  72  67  51  62  78  97  74  48
#[14] 115  83  75  83  67  71  72  81  93  46  66  57  60
#[27]  45  60  71  73  79  70 102  72  56 102  44  85  96
#[40]  77  49  43  77  87  67  59  75  80  63  61

# Plot the scatter plot 
plot(Test_2_scores, Test_1_scores, main = "Exam Results", xlab = "Test 1 Scores", ylab = "Test 2 Scores", col = 'red')
