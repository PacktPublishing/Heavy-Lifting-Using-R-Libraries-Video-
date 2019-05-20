library(leaflet)
library(magrittr)

#Get Data from https://data.sfgov.org/Public-Safety/SFPD-Incidents-Previous-Year-2016-/ritf-b9ki

SFmap <- leaflet() %>%
addTiles() %>%
setView(-122.42, 37.78, zoom = 13) %>%
addMarkers(-122.42, 37.78, popup = 'Bay Area')
SFmap

SFdata <- read.csv('SFPD_Incidents_-_Previous_Year__2015_.csv')
data <- subset(SFdata, Category == 'BRIBERY' | Category == 'SUICIDE')
SFmap %>%
addTiles() %>%
setView(-122.42, 37.78, zoom = 13) %>%
addMarkers(data = data, lng = ~ X, lat = ~ Y, popup = data$Category)

SFmap %>%
  addTiles() %>%
  setView(-122.42, 37.78, zoom = 13) %>%
  addCircleMarkers(data = data, lng = ~ X, lat = ~ Y, radius = 5,
                   color = ~ ifelse(Category == 'BRIBERY', 'red', 'blue'),
                   clusterOptions = markerClusterOptions())

