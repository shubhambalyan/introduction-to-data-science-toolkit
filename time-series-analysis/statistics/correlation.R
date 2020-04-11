# Correlation Function
# trees dataset - relationship b/w girth, height and volume

# Pair Plot
pairs(trees, pch = 21, bg = c("red"))

# Correlation
cor(trees)

# cor(trees)
#        Girth    Height    Volume
#Girth  1.0000000 0.5192801 0.9671194
#Height 0.5192801 1.0000000 0.5982497
#Volume 0.9671194 0.5982497 1.0000000

# Covariance
cov(trees)

#cov(trees)
#         Girth   Height    Volume
#Girth   9.847914 10.38333  49.88812
#Height 10.383333 40.60000  62.66000
#Volume 49.888118 62.66000 270.20280