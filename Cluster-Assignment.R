# GOAL: segment or cluster data into share similarities
# Bus problem for efficiency marketing with the limited resources the company has
# Solution make a promotion based off the analysis (PROFITS is our goal)

# New package
install.packages("factoextra")

# Libraries
library(tidyverse)
library(cluster)
library(factoextra)

# Data
Wine<- read.csv('WineData-1.csv')

####### Data Prep | MAKE SURE THERE IS NO NULL values, only numeric use

# Quantitative Data ONLY
str(Wine)
summary(Wine)

z <- Wine %>% select(-Campaign, -Varietal, -Origin, -Customer.Last.Name)

str(z)

# Normalize Data
z<- scale(z)
head(z)

############ Distance

# Calculate Distance
distance <- dist(z) # euclidean dist from "me" to "it"
print(distance)

# Cluster Deprogram --- Space out how differ observations or variables are 
clust_dend <- hclust(distance)
plot(clust_dend)

# K means Clustering 
set.seed(200)

k2 <- kmeans(z, centers = 2, nstart = 25) # 2 cluster, nstart "how many confi to create"
k2 # two clusters

fviz_cluster(k2, data = z)

k3 <- kmeans(z, centers = 3, nstart = 25) # 2 cluster, nstart "how many confi to create"
k3 # three clusters

fviz_cluster(k3, data = z)

########### Optimize --- To find the best amount of clusters
# Elbow Method --- Find 

fviz_nbclust(z, kmeans, method = "wss")       # 3 | find the bend in the 'elbow'
fviz_nbclust(z, kmeans, method = "silhouette")# See the line it asking for nine cluster
fviz_nbclust(z, kmeans, method = "gap_stat") # asking for 7 | go for three for efficiency


# Model Results

clusters <- kmeans(z,centers = 3, nstart = 25)

Wine <- Wine %>% mutate(cluster = clusters$cluster)
view(Wine)

Wine$cluster <- as.factor(Wine$cluster) # convert from num to factor

Wine %>% ggplot(aes(x = Minimum.Qty..kg., y = Discount...., col = cluster)) + geom_point(size = 5)

Wine %>% ggplot(aes(x = Minimum.Qty..kg., y = Offer.Bought, col = cluster)) + geom_point(size = 5)

Wine %>% ggplot(aes(x = Varietal, fill = cluster)) + geom_bar()
