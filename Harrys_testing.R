# Github:
install.packages('devtools')
devtools::install_github('bilintoh/timeseriesTrajectories')
# additional directions: type 1, enter, to update all packages

# Our Updates:
library(timeseriesTrajectories)
library(terra)

# Github:
rasstackY <- terra::rast(system.file("external/binary_raster_stack.tif",package="timeseriesTrajectories"))
rasstackY

plot(rasstackY)

# Our Updates:
plot(rasstackY, col = terrain.colors(10))


# Github:
reclass_df <- cbind(from = c(1), 
                    to = c(2), 
                    becomes = c(2))

rasstackY_v2 <- classify(rasstackY,reclass_df,include.lowest = TRUE)
# Issues: Doesn't run unless you run library(terra) first.

# Updated color to match github
plot(rasstackY_v2, col = terrain.colors(10))





# Specify the path to your RST file
file_path <- "Z:/Resources/mahakamDelta1/Mahakam_1999.rst"

# Read the file
rst_content <- readLines(file_path)

# Print the content
print(rst_content)


"Z:\Resources\mahakamDelta1\Mahakam_1999.rst"
"Z:\Resources\mahakamDelta1\Mahakam_2014.rst"
"Z:\Resources\mahakamDelta1\Mahakam_2018.rst"
"Z:\Resources\mahakamDelta1\Mahakam_2020.rst"
"Z:\Resources\mahakamDelta1\Mahakam_2022.rst"

