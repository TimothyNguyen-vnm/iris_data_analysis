#Install package
install.packages('dplyr')
install.packages('ggplot2')
install.packages('GGally')
install.packages('cluster')
install.packages('fpc')

library(dplyr)
library(reshape2)
library(ggplot2)
library(GGally)
library(cluster)
library(fpc)
#Explore Iris Dataset
iris
data(iris) 
#Use head to show top rows from data
head(iris)
head(iris,10)

#STEP 1: EXPLORE DATA ----------------------------
#1.1 Function summary to review data
summary(iris)

#1.2 Function names to show columns name
names(iris)
names(iris) <- tolower(names(iris))

#1.3 Function dim to show row and column counts
dim(iris)

#1.4 Function class to show data structure
class(iris)

#1.5 Function typeof and str to show data type
typeof(iris$sepal.length)
str(iris$sepal.length)

typeof(iris$species)
class(iris$species)
str(iris$species)

#STEP 2: TRANSFORM DATA  --------------------------
#2.1 Split data into subset
virginica <- iris[iris$species == 'virginica',]
virginica2 <- iris[iris$species == 'virginica' & iris$sepal.length > 6,]
head(virginica)

#2.2 Function select to select columns
selected <- select(iris, sepal.length, sepal.width)
head(selected)

#2.3 Function mutate to add column
newcol <- mutate(iris, longer = sepal.length / sepal.width )
newcol <- mutate(newcol, longer.2x = sepal.length > 2*sepal.width )
tail(newcol)

#2.4 Function arrange to sort data
newcol <- arrange(newcol, sepal.width)
newcol <- arrange(newcol, desc(sepal.width))


#2.5 Function melt to unpivot table (wide -> long)
iris.melt <- melt(iris, id = 'species', variable.name = 'size')
head(iris.melt)

#STEP 3: VISUALIZE DATA -----------------------
#3.1 Function hist to show histogram
hist(iris$sepal.length)

hist(iris$sepal.length,
     col='light blue',
     main='Histogram',
     xlab='Sepal.Length',
     ylab='Frequency')

hist(iris$sepal.length, col='red', breaks=20, main='Histogram', xlab='Size')
hist(iris$petal.length, col='green',breaks=30, add=TRUE)
legend('topright', 
       c('Sepal Length', 'Petal Length'), 
       fill=c('red', 'green'))

#3.2 Use ggplot to create charts
ggplot(iris.melt, aes(x=value, fill=size)) +
  geom_histogram(color ='#e9ecef', alpha = 0.6, position = 'identity')

ggplot(iris.melt, aes(x=value, fill=size)) +
  geom_histogram(color ='#e9ecef', alpha = 0.6, position = 'identity') +
  facet_wrap(~size)


#3.3 Function boxplot to create boxplot
boxplot(sepal.length ~ species,
        data = iris,
        main = 'Sepal Length by Species',
        xlab = 'Species',
        ylab = 'Sepal Length',
        col = 'light blue',
        border = 'black')

boxplot(value ~ size,
        data = iris.melt,
        main = 'Compare different size',
        xlab = 'Size',
        ylab = 'Value',
        col = 'light blue',
        border = 'black')


ggplot(iris.melt, aes(x=size, y=value, fill=size)) +
  geom_boxplot()+
  geom_jitter(color = 'black', size = 0.4, alpha = 0.9)

#3.4 Function plot to create scatter plot
plot(iris)

plot(iris[,1:4])

plot(iris$sepal.width, iris$sepal.length,
     col = 'steelblue',
     main = 'Scatterplot',
     xlab = 'Sepal Width',
     ylab = 'Sepal Length',
     pch = 19)

pairs(iris[,1:4],col=iris[,5],oma=c(4,4,6,12))
par(xpd=TRUE)

ggplot(iris, aes(x=sepal.length, y=sepal.width, color=species)) + 
  geom_point(size=5) 

ggpairs(iris,
        columns = 1:4,
        aes(color = species, alpha = 0.5))


#STEP 4: HYPOTHESIS TESTING WITH T-test ---------------
setosa <- iris[iris$species == 'setosa',]
versicolor <- iris[iris$species == 'versicolor',]

t.test(x= setosa$petal.length, y = versicolor$petal.length)

#STEP 5: ANALYSIS WITH ANOVA -----------------------------

petal.length.aov <- aov(formula = petal.length ~ species, data = iris)

summary(object = petal.length.aov)

TukeyHSD(petal.length.aov)

#STEP 6: CATEGORIZE SPECIES WITH K-MEAN CLUSTERING -------------
iris.test <- iris

iris.test$species <- NULL

head(iris.test)

kmeans.result <- kmeans(iris.test, 3)

table(iris$species, kmeans.result$cluster)

plot(iris.test[c('sepal.length', 'sepal.width')], col = kmeans.result$cluster)

plotcluster(iris.test, kmeans.result$cluster)

clusplot(iris.test, kmeans.result$cluster, color = TRUE, shade = TRUE)
