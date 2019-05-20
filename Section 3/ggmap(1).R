library(ggmap)
library(mapproj)

my_map=get_map(location="ireland",zoom=7,maptype = "terrain")
ggmap(my_map)

