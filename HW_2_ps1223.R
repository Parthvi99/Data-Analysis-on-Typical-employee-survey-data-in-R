---
title: "Parthvi Soni"
Course: "Business Forecasting "
Assignment : "HW_2"
---


# importing dataframe
library(ggplot2)

# get working directory
getwd()

df0 <- read.csv("Typical_Employee_Survey_Data.csv")
df <- data.frame(df0)

head(df)


# exploring dataframe
names(df)
ncol(df)
nrow(df)
dim(df)
head(df)
tail(df)
str(df) # displaying structure of df

class(df$gender) # displaying datatype of that particular col
df$gender <- as.factor(df$gender) # as--to convert datatype
class(df$gender)
str(df)


# Column
df$Age
df[1]

df[2]
df[c("Age")]
df[2:6]
df[c("Age","gender")]

# Rows
df[2,5] # comma means the rows --similar to coordinates

# Combined
df[2:7,c("satisfaction")]
df[4:8,2:3] # [col,row]

#Levels

df$gender
table(df$gender)
table(df$Age)
table(df$Age, df$satisfaction) # gives the frequency of one parameter with respect to other

#filtering
df[df$gender == 1,] #filters all the rows in gender with value 1

df$Age[df$years_of_experience >= 2] # prints the age of all the employees with years of experience >= 2

df$Make_Decisions[df$gender == 2] # prints the decisions made by women in the company

# Ordering

df[order(df$Age),] # ascending order of age
df[order(-df$Age),] #descending order of age

# Change Column Name
names(df)[4] <- "Characteristics_of_job"
head(df)

# changing values in df
df [1,1] <- 29
head(df)


# Graphing
barplot(df$Age)
barplot(df$Age, main = "Age of People", xlab = "People", ylab = "Age", col = "Blue")
pie(df$Age)
pie(df$Age,label = df$Name, main = "Age of People")

stem(df$years_of_experience)

?stem
stem(df$Age)
hist(df$Age)
boxplot(df$Age)
boxplot(df$Age,df$gender)

## Summary Stats

min(df$Age) # min age is 20
max(df$Age) # max age is 64
range(df$Age)
StatRange = max(df$Age) - min(df$Age)
StatRange
mean(df$Age)
sd(df$Age)
var(df$Age)
sqrt(var(df$Age))
fivenum(df$Age)
IQR(df$Age)
quantile(df$Age)
summary(df$Age)
boxplot.stats(df$Age)
boxplot.stats(df$Age)$out


# Data Frame Summary

summary(df)

by(df$Age,df$gender,mean)
by(df$Age,df$gender,sd)
by(df$Age,df$gender,summary)

aggregate(df$Age,list("Type" = df$gender),median)
aggregate(df$Age,list("Type" = df$gender),summary)


# extra visualisation

# getting to know the average age group in the company
plot1 <- ggplot(df, aes(x=Age)) + geom_bar() + labs(title="Frequency bar chart")
print(plot1)

# which gender is making more decisions in the company
plot2 <- ggplot(df, aes(x=gender, y=Make_Decisions, fill=gender)) + geom_bar(stat = "identity")
print(plot2)

# this plot shows the relationship of years of experience of employees with the
# job offer from other companies
ggplot(data=df, aes(x=Turn_down_job, y=years_of_experience, group=1)) +
  geom_point(color = "red")


# Creating summary tables using groupby
library(reactable)

options(reactable.theme = reactableTheme(
  color = "hsl(233, 9%, 87%)",
  backgroundColor = "hsl(233, 9%, 19%)",
  borderColor = "hsl(233, 9%, 22%)",
  stripedColor = "hsl(233, 12%, 22%)",
  highlightColor = "hsl(233, 12%, 24%)",
  inputStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
  selectStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
  pageButtonHoverStyle = list(backgroundColor = "hsl(233, 9%, 25%)"),
  pageButtonActiveStyle = list(backgroundColor = "hsl(233, 9%, 28%)")
))
reactable(df,  groupBy = "Age",
          searchable = TRUE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          theme = reactableTheme(
            borderColor = "#dfe2e5",
            stripedColor = "#f6f8fa",
            highlightColor = "#f0f5f9",
            cellPadding = "8px 12px",
            style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"),
            searchInputStyle = list(width = "100%")
          ))








