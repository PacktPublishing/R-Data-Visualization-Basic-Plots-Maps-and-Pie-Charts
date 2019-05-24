set.seed(5)
x = rnorm(10)
y = rnorm(10)
z = seq(1,10, by = 1)

mtx = data.frame(cbind(x,y,z))

d = dist(mtx, method = "euclidean")
?dist
clust = hclust(d, "ave")

?hclust

par(mfrow = c(1,2))
plot(mtx$x,mtx$y, type = "n", xlab = "x", ylab = "y") # generates the plot on the left side
text(mtx$x,mtx$y, labels = z) # applies labels to plot on the left
plot(clust, main = "Dendrogram") # generates plot on the right

data = data.frame(USArrests[,1:3])

dt = dist(data, method = "euclidean")

clust = hclust(dt)

plot(data$Murder, data$Assault) # generates a scatter plot
text(USArrests$Murder,USArrests$Assault, labels = row.names(USArrests), cex = 0.6) 
plot(clust) # generates a dendrogram plot
#################################################################################

install.packages("dendroextras")
library(dendroextras)

data(USArrests)

View(USArrests)

par(mar = c(2,10,2,10), cex = 0.6)

clst1=colour_clusters(hclust(dist(USArrests),
                             "ave"),5,groupLabels=as.roman)
par(mar = rep(2, 4))
plot(clst1, main = "Dendrogram with 5 clusters", horiz = TRUE)

plot(clst1, main = "Dendrogram with 5 clusters", horiz = TRUE, type = "triangle")

install.packages("NeatMap")
library(NeatMap)

clust = hclust(dist(USArrests), method = "complete")

pos<-nMDS(USArrests,metric="euclidean")

draw.dendrogram3d(clust,pos$x,labels=rownames(USArrests),
                  label.size=0.75)

#############Heat Map###############

install.packages("pheatmap")
library(pheatmap)

irq = read.csv("iraqbdc.csv", header = TRUE, sep =",")

row.names(irq)=irq$years

irq = data.matrix(irq)
?data.matrix
View(irq)
dim(irq)
irq = data.matrix(irq[,2:13])

pheatmap(irq, cluster_row= FALSE, cluster_col = FALSE, main ="Iraq Body Count")

heatmap(irq, Rowv = NA, Colv = NA, main = "Iraq Body Count Heat Map",
        xlab = " Body Count per month", ylab = "Years")

?heatmap
#######################################################################################

install.packages(c("pheatmap","RColorBrewer"))

library(RColorBrewer)
library(pheatmap)

irq = read.csv("iraqbdc.csv", header = TRUE, sep =",")
row.names(irq) = irq$years
irq = data.matrix(irq)
irq = data.matrix(irq[,2:13])

heatcolor = brewer.pal(7,"Greens")

display.brewer.all()

pheatmap(irq, cluster_row= FALSE, cluster_col = FALSE,
         display_numbers = TRUE, color = heatcolor, main =
           "Iraq Body Count", fontsize_number = 10)
#########################################################################

install.packages("pheatmap")
library(pheatmap)

data = as.matrix(scale(USArrests))

clst = hclust(dist(data))

pheatmap(data)

pc = prcomp(USArrests, scale = TRUE)
biplot (pc , scale =0, col =c("red","blue"), cex = c(0.8,1),
        xlab = "First Principal Component", ylab = "Second Principal Component")
abline(h = 0, lty =2)
abline(v = 0, lty =2)

##########################################################
library(NeatMap)

irq = read.csv("iraqbdc.csv", header = TRUE, sep =",")
irq$years= row.names(irq)
irq = data.matrix(irq)

make.profileplot3d(irq,row.method="PCA",column.method="average.linkage",
                   col = c("red","green","blue"),
                   point.size = 10, labels = row.names(irq))

make.stereo.profileplot3d(irq,row.method="PCA",column.method="average.linkage",
                          labels = row.names(irq), label.size = 1)
###################################################################################

install.packages("googleVis")
library(googleVis)

shk = read.csv("shrink.csv", header = TRUE, sep =",")

shk$Parent[shk$CountryName == "World"]= NA

tree = gvisTreeMap(shk, idvar = "CountryName", parentvar ="Parent",
                   sizevar = "X2009", colorvar = "Change",
                   options=list(width = 900, height = 500,showScale = TRUE,
                          maxColor ="#009933", minColor ="#CC0000",
                          title = "change in GDP per capita, PPP (constant 2011 $)",
                          fontColor = "black"))
plot(tree)


shk = read.csv("shrink1.csv", header = TRUE, sep =",")
tree = gvisTreeMap(shk, idvar = "CountryName", parentvar ="Parent",
                   sizevar = "X2009", colorvar = "Change")
plot(tree)




