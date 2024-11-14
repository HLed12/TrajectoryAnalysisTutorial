## Trajectory Analysis Scripts
## load packages
library(raster)
library(terra)

# four categories in our datasets::: Mangrove, Pond Aquaculture, Water, Other LandCover
## load datasets
ras1999 <- rast("C:/Users/rufai/OneDrive/Desktop/GSG Courses/GEOG360/Final\ Project/mahakam_delta_time_series/Mahakam_1999.rst")
ras2014 <- rast("C:/Users/rufai/OneDrive/Desktop/GSG Courses/GEOG360/Final\ Project/mahakam_delta_time_series/Mahakam_2014.rst")
ras2018 <- rast("C:/Users/rufai/OneDrive/Desktop/GSG Courses/GEOG360/Final\ Project/mahakam_delta_time_series/Mahakam_2018.rst")
ras2020 <- rast("C:/Users/rufai/OneDrive/Desktop/GSG Courses/GEOG360/Final\ Project/mahakam_delta_time_series/Mahakam_2020.rst")
ras2022 <- rast("C:/Users/rufai/OneDrive/Desktop/GSG Courses/GEOG360/Final\ Project/mahakam_delta_time_series/Mahakam_2022.rst")

# extract categories
categories1999 <- unique(values(ras1999))
categories1999 <- categories1999[!is.na(categories1999)]

categories2014 <- unique(values(ras2014))
categories2014 <- categories2014[!is.na(categories2014)]

categories2018 <- unique(values(ras2018))
categories2018 <- categories2018[!is.na(categories2018)]

categories2020 <- unique(values(ras2020))
categories2020 <- categories2020[!is.na(categories2020)]

categories2022 <- unique(values(ras2022))
categories2022 <- categories2022[!is.na(categories2022)]

# generate binary maps per year
category_layers2022 <- lapply(categories2022, function(cat) {
  layer <- ras2022 == cat
  names(layer) <- paste0("category2022_", cat)
  return(layer)
})

category_layers2020 <- lapply(categories2020, function(cat) {
  layer <- ras2020 == cat
  names(layer) <- paste0("category2020_", cat)
  return(layer)
})

category_layers2018 <- lapply(categories2018, function(cat) {
  layer <- ras2018 == cat
  names(layer) <- paste0("category2018_", cat)
  return(layer)
})

category_layers2014 <- lapply(categories2014, function(cat) {
  layer <- ras2014 == cat
  names(layer) <- paste0("category2014_", cat)
  return(layer)
})

category_layers1999 <- lapply(categories1999, function(cat) {
  layer <- ras1999 == cat
  names(layer) <- paste0("category1999_", cat)
  return(layer)
})


# stack mangroves categories across five time points and save to tiff
mangroves_stack <- c(category_layers1999[[2]], 
                     category_layers2014[[3]], 
                     category_layers2018[[2]],
                     category_layers2020[[2]],
                     category_layers2022[[2]]
)
years <- c(1999, 2014, 2018, 2020, 2022)
names(mangroves_stack) <- years

mangrove_colors <- c("blue", "red")

par(mfrow = c(2, 3))
for (i in 1:nlyr(mangroves_stack)) {
  plot(mangroves_stack[[i]], col = mangrove_colors, 
       main = paste("Mangrove Presence in", years[i]),
       axes = TRUE)
}
par(mfrow = c(1, 1))  # Reset layout
plot.new()

writeRaster(mangroves_stack,
            "C:/Users/rufai/OneDrive/Desktop/GSG\ Courses/GEOG360/Final\ Project/mangroves_stacked.tif",
            overwrite = TRUE)


# trajectory analysis
rastStack <- rast("C:/Users/rufai/OneDrive/Desktop/GSG\ Courses/GEOG360/Final\ Project/mangroves_stacked.tif")

#rastStack <- terra::rast(system.file("C:/Users/rufai/OneDrive/Desktop/GSG\ Courses/GEOG360/Final\ Project/mangroves_stacked.tif",
#                                     package="timeseriesTrajectories"))
# the system.file is used to load files installed within R

library("timeseriesTrajectories")

vert_units <- "number of pixels"
dataPreview(rastStack,
            timepoints = years,
            vertunits = vert_units,
            xAngle = 0)

num_pres_change <- presenceData(rastStack, nodata = -999)

presencePlot(num_pres_change,
             pltunit = "m",
             dataEpsg = 2933,
             scalePos = "bottomright",
             narrowPos = "topleft",
             narrowSize = 1,
             categoryName = "Mangroves",
             xAxis = "Longitude (m)",
             yAxis = "Latitude (m)",
             axisText = 1,
             axisLabel = 1,
             plotTitle = 1.2)

traj_data <- rastertrajData(rastStack,
                            zeroabsence = 'yes')

# Let's take a look.
traj_data

trajPlot(traj_data,
         axisShow = "no",
         categoryName = "Mangroves",
         narrowPos = NA,
         scalePos = NA,
         scaleSize = 1.5,
         axisText = 1.2,
         axisLabel = 1.2,
         plotTitle = 1,
         legendTex = 1,
         xAxis = "Longitude (m)",
         yAxis = "Latitude (m)",
         downsample = TRUE)

stackbar_data <- rasterstackData(rastStack,
                                 timePoints = years,
                                 spatialextent = 'unified',
                                 zeroabsence = 'yes',
                                 annualchange = 'yes',
                                 categoryName = 'variable',
                                 regionName = 'Mahakam Delta',
                                 varUnits = "(Square Kilometers)",
                                 constant  = 1)

stackbar_data

stackbarPlot(stackbar_data,
             axisSize = 10,
             lbAxSize = 10,
             lgSize = 7.5,
             titleSize = 12,
             datbreaks = "no",
             upperlym = 35,
             lowerlym = - 50,
             lymby = 5,
             upperlym2 = 0.5,
             lymby2 = 0.1,
             xAngle = 0)


