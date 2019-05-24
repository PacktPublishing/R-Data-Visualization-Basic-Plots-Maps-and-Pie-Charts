
install.packages("googleVis")
library(googleVis)


debt = read.csv("debt.csv", header = TRUE, sep =",")

View(debt)

head(debt)

eurdebt <- gvisGeoMap(debt, locationvar="Country",
                      numvar="Debt_to_GDP_Ratio_2003",hovervar="text",
                      options = list(width = "600px", height ="700px",
                                     dataMode = "regions", region = '150',
                                     colors= "[0xF8DFA7,0x8D9569,
                                     0xE9CC99,0xE2AD5A,0xCA7363]"))

plot(eurdebt)


###########################################################################
library(googleVis)

well = read.csv("wellbeing.csv", header = TRUE, sep =",")

USA <- gvisGeoMap(well, locationvar="State",numvar="Score",
                  hovervar = "text",
                  options = list(width = "600px", height ="700px",dataMode =
                                   "regions", region = "US",colors=
                                   "[0x64693D,0xF1CC80,0xEABA58,0xE3A732,0xDC9411]"))

plot(USA)

obese = read.csv("obesity.csv", header = TRUE, sep =",")

US_2012 <- gvisGeoMap(obese, locationvar="state",numvar ="X2012",
                      options = list(width = 500, height =300,dataMode = "regions",
                                    region = "US",colors=
                                    "[0x64693D,0xF1CC80,0xEABA58,0xE3A732,0xDC9411]"))

US_2011 <- gvisGeoMap(obese, locationvar="state",numvar ="X2011",
                      options = list(width = 500, height =300,dataMode = "regions",
                                    region = "US",colors=
                                    "[0x64693D,0xF1CC80,0xEABA58,0xE3A732,0xDC9411]"))

US_2010 <- gvisGeoMap(obese, locationvar="state",numvar ="X2010",
                      options = list(width = 500, height =300,dataMode = "regions",
                                    region = "US",colors=
                                    "[0x64693D,0xF1CC80,0xEABA58,0xE3A732,0xDC9411]"))

US_2009 <- gvisGeoMap(obese, locationvar="state",numvar ="X2009",
                      options = list(width = 500, height =300,dataMode = "regions",
                                   region = "US",colors=
                                    "[0x64693D,0xF1CC80,0xEABA58,0xE3A732,0xDC9411]"))

merged = gvisMerge(gvisMerge(US_2009,US_2010, horizontal =
                               TRUE),gvisMerge(US_2011,US_2012, horizontal = TRUE))
plot(merged)
####################################################################################


contour(volcano, main = "Topographic map of a Volcano",
        col = "blue")

filled.contour(volcano, color.palette = terrain.colors,
               main = "Topographic map of a Volcano")


filled.contour(volcano, color.palette = topo.colors,
               main = "Topographic map of a Volcano")
filled.contour(volcano, color.palette = heat.colors,
               main = "Topographic map of a Volcano")

?colorRamp

install.packages("RColorBrewer")
library(RColorBrewer)
custom = brewer.pal(9, "BuPu")
filled.contour(volcano, col = custom, main = "Topographic
               map of a Volcano")

install.packages("ggmap", dependencies = TRUE)
library(ggmap)

colide = read.csv("collisions.csv", header = TRUE, sep =",")

nyc = get_map("newyorkcity", zoom = 12)

nycmap <- ggmap(nyc, extent = "device", legend = "topleft")

nycmap +
  stat_density2d(
    aes(x = LONGITUDE, y = LATITUDE, fill = ..level..,alpha = ..level..),
    size = 2, bins = 4, data = colide,
    geom = "polygon"
  )

########################################################################

library(googleVis)

emisn = read.csv("ghg.csv",sep =",", header = TRUE)

head(emisn)

emit = gvisGeoChart(emisn,locationvar = "Country",
                    sizevar = "Emission_in_2010",
                    options = list(displayMode = "markers",width = 900, height=500,
                                   markerOpacity = 0.5,sizeAxis="{maxSize:'35'}",
                                   colorAxis="{colors:['green','red']}"))
plot(emit)

emisn1= read.csv("ghg1.csv")
emit1 = gvisLineChart(emisn1, xvar = "Year",
                      yvar=c("Brazil","China","India","Russia","USA"),
                      options = list( width = 500, height =500,
                                      title ="Green House Gas Emissions",
                                      vAxis="{title:'Million Metric tons of CO2'}",
                                      hAxis="{title:'Year'}",
                                      gvis.editor ="Edit the Line Chart"))

merge = gvisMerge(emit,emit1, horizontal = TRUE)
plot(merge)
#####################################################




install.packages("maps")
library(maps)


names = read.csv("names.csv")

View(names)

map("state")

?map

for(i in 1: 50){
  text(names$lon[i],names$lat[i], names$name[i], adj= 0.5)
}

text(-86.8073, 32.799,"EMMA")

############################################################################
















