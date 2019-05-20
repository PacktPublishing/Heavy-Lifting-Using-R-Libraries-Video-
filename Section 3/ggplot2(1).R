head(quakes)

plot(x=quakes$long,y=quakes$lat)

ggplot(quakes,aes(x=mag))+
  geom_histogram(bins =50)

ggplot(quakes,aes(x=lat, y=long, col=mag))+
geom_point()

geom_ #wide range of plots available! can see using autofill

ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+
  geom_point()

ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=mtcars$am))+
  geom_point()

ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg,col=mtcars$am,size=mtcars$cyl))+
  facet_grid(~gear)+geom_point()

ggplot(mtcars,aes(x=mtcars$wt,y=mtcars$mpg))+
  geom_point()+
  geom_smooth(method='lm',formula=y~x)

