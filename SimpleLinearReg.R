#Set your workspace
setwd('D:/EVARCITY')

#load data
data = read.csv('Marketing_Data.csv',sep=',')

#check missing values
colSums(is.na(data))

# or apply(data,2,function(x) sum(is.na(x))) 

#replace missing values with 0
data[is.na(data)]<-0

#check missing values after replacing
colSums(is.na(data))

# install and load ggplot2

install.packages('ggplot2')
library('ggplot2')

# ggplot scatter for sales vs youtube,facebook,newspaper

ggplot(data, aes(x = data$youtube, y = data$sales)) +geom_point()

ggplot(data, aes(x = data$facebook, y = data$sales)) +geom_point()

ggplot(data, aes(x = data$newspaper, y = data$sales)) +geom_point()

#drop newspaper as it does not have relation with sales as it doe not have linear.
data = subset(data, select = -c(newspaper) ) 


#there should not be multi-collinearity among independent variable
cor(data[c(2,3)])  # correlation is 0.05 which shows they are not collinear
#heatmap to depcit correlation
heatmap(cor(data[c(2,3)]),main = "Correlation Heatmap")



# install and load ca tools
install.packages('caTools')
library(caTools)



