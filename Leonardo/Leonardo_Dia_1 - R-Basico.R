#Curso basico de R - Gvenck
#27-05-2026
#Dr. Leonardo da Costa

#Contatos:
#email: leo.olaveirasc@outlook.com
#linkedin: /in/leonardo-oliveirasc/

# ----- Modulo 2 - Estatistica e Experimentacao-----

#>To cite R in publications
citation()
R.Version()

#[!] Important concept: Take care with the writing. R is case sensitive
Citation()

#>R can be used as a calculator

#Addition


#Subtraction


#Multiplication


#Division


#Square Root


#Exponentiation


#We can also increase the complexity of a calculation
2+2*3+5 

#If an operation must be performed first, it should be placed inside parentheses
(2+2)*3+8 

#If parentheses are redundant, R ignores them
2+(2*3)+5 

# --- Managing objects in R ---

#To assign a value to an object, we use the symbols "<-" and "="
object <- 1
object

#or
object = 1
object

#it cannot start with some characters such as numbers
@a<- 1 #not possible
1a <- 1 #not possible
a1 <- 1 #possible

#Objects can be used for operations:
x <- 3
y <- 9
c <- x*y
c

# --- Objects classes ---

#Numeric
#Character
#Factor
#Logic
#List
#Data Frame
#and More!

#You can check the object class using the class() function
a<-1
b<-'b'
class(a)
class(b)

#Objects can store more than one piece of information using the c() function
#These objects are called vectors

#Numeric values
v1 <-
class(v1)

#Character values
v2 <- 
class(v2)

#Both
v3 <-
class(v3)

#Quotation marks indicate the presence of characters
v4<-
class(v4)

#You can convert class types!
as.numeric(v4) #Character to numeric
as.numeric(v3)

as.character(v1) #Numeric to character

#[!] Important concept: Indexing

#Only the first value:
v1
v1[1]

#Only the fifth value:
v2
v2[5]

#We can also replace a specific value
v1
v2

v1[2]<-
v2[2]<-

v1
v2

#We can also add a value
v1 <- 
v1

#We can also remove a value
v1 <-
v1

#Information can also be stored in another type of object called a list
#A list works like a container. The list() function is used to create it
l<-
l

class(l)

#To access an object inside a list, a different indexing method is used

l[[1]] #first object
l[[2]] #second object
l[[3]] #third object

l[[4]] #fourth object (does not exist)

#The most commonly used object type in data analysis is called a data frame
#A data frame is simply a table created with the data.frame() function

v1
v2

df <-
df

names(df)<-c('dbh','progeny')
df
class(df)

#It is also possible to assign column names directly in the command

df<-  #Numbers and Letters Columns
df

#[!] Important concept: It is also possible to access data frame information through indexing
#In this case we need to specify row and column [row,column]

df[1,2] #Row 1, Column 2
df[3,1] #Row 3, Column 1

#Information from an entire column
df[,1]
df[,2]

#By column name
df['Numbers']

#Now Letters
df[]

#While the first option generates a vector, the second generates only a slice of the data frame
class(df[,2])
class(df['Numbers']) 

#Or even
df$Numbers

#Now Letters
df$
  
#Specific row
df[2,]

#Try a different row!
df[,]

#A specific group of rows
df[1:5,]
df[2:5,]

#Order is important?
df[,]

#For exploratory analysis of a data frame we can use several functions
#View first rows | head()


#View last rows | tail()


#Summary of the data frame | summary()


#View the structure of the data frame | str()


# --- Logical operations ---

#We can test whether one value is equal or different from another value
#The returned values will be TRUE or FALSE

#Is value x equal to value y? x==y


#Is value x different from value y? x!=y


#TRUE and FALSE are logical values

#We can also do this with objects
v1==v2
v2!=v3

#We can filter objects using logical operations

#All values bigger than 1
v1>1
v1[v1>1]

#All values smaller than 4
v1<4
v1[v1<4]

#[!] Important concept: or even data.frames
df$Numbers>5

# All rows with Numbers > 5
df[df$Numbers>5,] 

# --- Packages and functions ---

#Often we want to perform an analysis that is not available in base R
#For this, we install packages developed by researchers and made available for download

#Citing R
citation()
R.Version() #R version
library() #Available packages

#To download and install a package we use the install.packages() function

install.packages("agricolae") #example

#To load the installed package we use the library() command

library(agricolae)

#Now you can use the functions from the installed package
#To learn more about a package, use the help section (?package/function name)

??agricolae #Package
?anova #Package function

#To cite this package
citation('agricolae')

#Package version
packageVersion('agricolae')

##Functions are essential tools in R. We have already used many of them here such as c(), library(), str(), etc.
#Functions have arguments. These arguments allow the function to correctly perform the task it was built for

#Example 1: sum() function
#The sum() function was created to add all elements of a numeric vector

v1
sum(v1)

#For the sum() function to work, the only required argument is the vector.
#To view other arguments of the function we use the ? command

?sum

#Notice there is an extra argument called na.rm. Let's see how it works

v1[1] <- NA
v1

sum(v1) #Notice that with a missing value, the function returns NA. To avoid this we use the na.rm argument

sum(v1,na.rm=T) #Now the result is numeric because the missing value was ignored

#Example 2: head() and tail()
#The head and tail functions require an object of any type
#An interesting argument is "n". This argument allows you to select the number of rows to display
?head

head(x = df,n=3)
tail(x = df, n=3)

#All functions have their own arguments, and it takes study and practice to master each one

#We can create our own function!
cv<-function(x) sd(x)*100/mean(x)

# --- Reading Tables ---

#To import tables from your computer into R we use the read.table() function
#However, there are other options such as:

#read.csv() - Specifically for reading .csv files
#read.xlsx() - Function for reading Excel files available in the readxl package

#1st - We need to make sure we are working in the folder where the table is located
#Press Control + Shift + H and choose the folder
#setwd()

#To check your current working directory use the getwd() function
getwd()

data <- read.csv("iris.csv") #Do not forget the file extension, e.g. ".txt"
class(data)

#Notice that the table was imported as a data frame
str(data)

head(data, n=10)

##We can also access specific information
data[1,2] #row 1, column 2

# --- Creating plots ---
#Scatter plot
plot(data$Sepal.Length,data$Sepal.Width)

#Line plot
plot(data$Sepal.Length,type = "l")

#Boxplot
boxplot(data$Sepal.Length)

#Histogram
hist(data$Sepal.Length)

#It is possible to change some parameters such as color, axis labels, title, and element size
?plot

plot(data$Sepal.Length, col=rainbow(25), ylab='Sepal Length', main="Scatter Plot", pch=17, cex=2)
par(family = "serif")

boxplot(data$Petal.Width, col= c("orange"), ylab='Petal Width', main="BoxPlot", family ='serif')
summary(data$Petal.Width)

hist(data$Petal.Width, col=rainbow(15), ylab='t.ha',xlab= 'Classes', main="Histogram")

# --- Basic Stats ---
mean(data$Petal.Width,na.rm = T)    #Mean
sum(data$Petal.Width,na.rm=T)       #Sum
max(data$Petal.Width,na.rm=T)       #Maximum
min(data$Petal.Width,na.rm = T)     #Minimum
median(data$Petal.Width,na.rm=T)    #Median

var(data$Petal.Width, na.rm=T)      #Variance
sd(data$Petal.Width,na.rm=T)        #Standard deviation


# --- Extra: Loop for ---

#count to 10

print(1)
print(2)
print(3)
print(4)

#Uses i to represent all values from 1 to 10 one by one
for(i in 1:10) print(i)

#Each row from data
rows<-1:nrow(data)
rows

for(r in rows) print(data[r,])

#Each column from data | ncol()
cols<-
cols

#More complex uses
species<-unique(data$Species)

for(s in 1:length(species)){ #from 1 to number of unique values


}

#Same as:
tapply(data$Sepal.Length,data$Species,mean)




