######Installing packages and getting help in R##########

install.packages(c("plotrix",
                   "RColorBrewer"))

library(plotrix)
library(RColorBrewer)

?plot
?plot()

#########Data types in R and Special Values in R#######

x = c(1:5) # Numeric Vector

x

y ="I am Home" # Character Vector

y

c = c(1+3i) #complex vector
c

z = list(c(1:5),"I am Home") # List
z


z = c( 1,2,3, NA,5,NA) # NA in R is missing Data

z

complete.cases(z) # function to detect NA
is.na(z) # function to detect NA

clean <- complete.cases(z)
z[clean] # used to remove NA from data

##NaN
0/0

m <- c(2/3,3/3,0/0)
m

is.finite(m)
is.infinite(m)
is.nan(m)

## infinite
k = 1/0
k

dk=c(1,45,67,20)

anyNA(dk)

dk[3]=NA

########Matrices in R and Editing a matrix in R########

vec = c(1:10)
vec

mat = matrix(c(1,2,3,4,5,6,7,8,9,10),nrow = 2, ncol = 5)
mat

?matrix

t(mat) # transpose a matrix

d = diag(3) # generate an identity matrix
d
?diag

zro = matrix(rep(0,6),ncol = 2,nrow = 3 )# generate amatrix of Zeros
zro

mat = matrix(c(1:10),nrow = 2, ncol = 5)

mat

mat[2,3]

mat[2,3] = 16

mat[2,3]

mat[2, ]

######Data Frames and Editing a data frame in R#####

data = data.frame(x = c(1:4), y = c("tom","jerry","luke","brian"))

data

mat = matrix(c(1:10), nrow = 2, ncol = 5)

data.frame(mat)

?data.frame

data$age = c(2,2,3,5)
data

age = c(2,2,3,5)
data = cbind(data, age)

data

data = data[,-2]
data

data = data.frame(x = c(1:4), y = c("tom","jerry","luke","brian"))
data = data[c(2,1)]# will reorder the columnsdata

data

names(data)

colnames(data) = c("Number","Names")

###############################

getwd()

setwd("C:\\Users\\sandhyao\\Desktop\\R April\\R Data Visualisation\\Section 01")

####Importing data in R#####

test = read.csv("raw.csv", sep = ",", header = TRUE)
test

data=read.table("raw.csv",header=TRUE,sep=",") 

data

row.names(data)

data=read.table("raw.csv",header=TRUE,sep=",", row.names=c("Names"))

row.names(data)

View(data)

####Exporting data in R#########

write.table(data, "mydata.csv", sep=",")

#####Writing a function in R#######

source('add.R')

add(2,15)


######Writing if else statements in R#####

x=2

if(x>3){
  print("greater value")
}else {
  print("lesser value")
}

######Basic loops in R#####

x = c(1:10)
y = c(1:10)
z=0

for(i in 1:10){
  z[i] = x[i]*y[i]
}

z
######Nested loops in R###
mat= matrix(1:25, 5,5)

for (i in 1:5){
  for (j in 1:5){
    if (i ==j){
      print(mat[i,j])
    }
  }
}

#####Using par to beautify a plot in R#####

mat= matrix(1:25, 5,5)

apply(mat,1,sd) # 1 will do row wise computation

apply(mat,2,sd) # 2 will do column wise computation

j = list(x = 1:4, b = rnorm(100,1,2))

lapply(j,mean)

tapply(mtcars$mpg,mtcars$gear,mean)

#####Saving Plot#####
?par

x=c(1:10)
y=c(1:10)

par(bg = "#646989", las = 1, col.lab = "black", col.axis ="white",
    bty = "n",cex.axis = 0.9,cex.lab= 1.5)

plot(x,y, pch = 20, xlab = "fake x data", ylab = "fake y data")


png("TEST.png", width = 300, height = 600)

plot(x,y, xlab = "x axis", ylab = "y axis", cex.lab = 3,
     col.lab ="red", main = "some data", cex.main=1.5, col.main = "red")

dev.off()

#############################################################





