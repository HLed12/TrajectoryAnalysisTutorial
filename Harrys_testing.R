# Bilintoh's Github README tutorial


install.packages('devtools')
devtools::install_github('bilintoh/timeseriesTrajectories')
# additional directions: when prompted type '1' -> enter, to update all packages

# Our Updates:
library(timeseriesTrajectories)
library(terra)
##### 

rasstackY <- terra::rast(system.file("external/binary_raster_stack.tif",package="timeseriesTrajectories"))
rasstackY

plot(rasstackY) # going forward, not including github plot statements, just
                # adding the proper pallette as an 'Update'

# Our Updates: (to get the same color pallette)
plot(rasstackY, col = terrain.colors(10))
#####

# Github:
reclass_df <- cbind(from = c(1), 
                    to = c(2), 
                    becomes = c(2))

rasstackY_v2 <- classify(rasstackY,reclass_df,include.lowest = TRUE)

# Updated color to match github
plot(rasstackY_v2, col = terrain.colors(10))
#####


# Updates/TBD:
# Bilintoh's initial file is binary raster. We are using a raster a 5-category 
# raster file. How does this alter the instructions?


# Specify the path to your RST file
# NOTE: you will need to update the file path to where your machine has the data
#       Also, the '\' will need to be changed to '/'
file_path <- "Z:/Resources/mahakamDelta1/Mahakam_1999.rst"



# List of all 5 file paths
file_path99 <- "Z:\Resources\mahakamDelta1\Mahakam_1999.rst"
file_path14 <- "Z:\Resources\mahakamDelta1\Mahakam_2014.rst"
file_path18 <- "Z:\Resources\mahakamDelta1\Mahakam_2018.rst"
file_path20 <- "Z:\Resources\mahakamDelta1\Mahakam_2020.rst"
file_path22 <- "Z:\Resources\mahakamDelta1\Mahakam_2022.rst"



##########################################
# Ignoring Bilintoh's Tutorial from here #
##########################################


