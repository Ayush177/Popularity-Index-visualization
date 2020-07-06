library(dbConnect)
library(RMySQL)

con = dbConnect(MySQL(), user="root", password="", dbname="test", host="127.0.0.1")
dbListTables(con)  
#Create table in R from mysql table
myquery <- "select * from images;"
df <- dbGetQuery(con, myquery)
str(df)
summary(df)

df$rating <- factor(df$rating)
str(df$rating)
summary(df$rating)

library(ggplot2)

ggplot(data=df, aes(x=rating, y=matches))

ggplot(data=df, aes(x=rating, y=matches))+ geom_point()

ggplot(data=df, aes(x=rating, y=matches, colour=matches))+ geom_point()

p  <- ggplot(data=df, aes(x=rating, y=matches, colour=matches))+ geom_point()

p + geom_line() + geom_point()

#Histogram

s <- ggplot(data=df, aes(x=matches))
s + geom_histogram(binwidth=1)

#Starting Layer

t <- ggplot(data=df)
t + geom_histogram(binwidth = 1,
                   aes(x=matches),
                   fill="yellow",
                   color="Blue")

#statistical transformation

?geom_histogram(aes())

u <- ggplot(data=df, aes(x=rating, y=matches,
                         colour=rating))
u + geom_point() + geom_smooth(fill=NA)

#facet

s + geom_histogram(binwidth=1,aes(fill=rating),
                   colour="Black")

s + geom_histogram(binwidth=1,aes(fill=rating),
                   colour="Black")+
      facet_grid(rating~.,scale="free")

#scatterplots:

u + geom_point(size=3)

#facets
u + geom_point(size=3) +
  facet_grid(rating~.)

u + geom_point(size=3) +
  facet_grid(matches~.)

u + geom_point(size=3) +
  facet_grid(rating~matches)

u + geom_point(size=3) +
  facet_grid(matches~rating)
    