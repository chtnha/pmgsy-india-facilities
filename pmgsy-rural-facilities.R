#set the working directory where csv available
setwd("~/Desktop/pmgsy-india-facilities")

#read csv and store in the object karnatakaFacilities
karnatakaFacilities <- read.csv("pmgsy_facilities_karnataka.csv")

#check the structure of csv
str(karnatakaFacilities)

#check all the variables
names(karnatakaFacilities)

#check first 6 features
head(karnatakaFacilities)

#install packages 
install.packages("sf")
install.packages("ggplot2")
install.packages("ggmap")

#load the libraries 
library(sf)
library(ggmap)

#convert the foreign object to simple features (sf)
karnatakaFacilitiesShpFile <- st_as_sf(karnatakaFacilities, coords = c("Longitude", "Lattitude"))

#view first 10 features
karnatakaFacilitiesShpFile

#set the coordinate reference system (CRS) for the shape file
st_crs(karnatakaFacilitiesShpFile) <- 4326

#write sf objects to database
st_write(karnatakaFacilitiesShpFile, "~/Desktop/pmgsy-india-facilities", driver = "ESRI Shapefile")

#plot only Facility Categories
plot(karnatakaFacilitiesShpFile["Facility.Category"], key.pos = 1, pch = 20, type = "p", axes = TRUE) 

#plot overall facilities with title & labels (x & y axes) 
ggplot() + geom_sf(data = karnatakaFacilitiesShpFile, colour = "#b921d2", size = 0.01) +
  xlab("Longitude") + ylab("Lattitude") +
  ggtitle("PMGSY Facilities in Karnataka")
                   



