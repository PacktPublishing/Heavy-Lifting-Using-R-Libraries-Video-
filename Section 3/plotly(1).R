library(plotly)

plot_ly(mtcars,x=mtcars$wt,y=mtcars$mpg)
plot_ly(mtcars,x=mtcars$wt,y=mtcars$mpg,color=mtcars$am)


set.seed(100)
diamonds$carat=as.numeric(diamonds$carat)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = ~carat, y = ~price, color = ~carat,
        size = ~carat, text = ~paste("Clarity: ", clarity))

#we can make our ggplots interactive plots using ggplotly
p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity))) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

ggplotly(p)


