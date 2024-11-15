#1. Install “raster” package
#2.	Get raster library
library(raster)
#3.	Create and assign a raster variable
name_of_rasterVar <- raster(“path”)
#4.	Set the value of the wanted category
name_of_catVar <- #
#5.	Create binary map
name_of_binaryMap <- name_of_rasterVar == name_of_catVar
#6.	Save to file
writeRaster(name_of_binaryMap, "path_to_save_binary_map.rst", format = "rst")
#7.	Optional Plot the Map
a.	Plot(name_of_binaryMap)

#JustCode
library(raster)
name_of_rasterVar <- raster(“path”)
name_of_catVar <- #
name_of_binaryMap <- name_of_rasterVar == name_of_catVar
writeRaster(name_of_binaryMap, "path_to_save_binary_map.rst", format = "rst")
