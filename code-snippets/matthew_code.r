library(ggplot2)
library(dplyr)
library(artpack)
#data 
sky <- tibble(x=0, xend=4, y = seq(0,3,length=100), yend=y, 
color=art_pals("sunnyside",100), linewidth=10)
#moon
moon <- tibble(x=2, y=1.5, size=100, fill="white", color="black")
#plot the moon
sky %>%
  ggplot(aes(x,y,xend=xend,yend=yend))+
  theme_void()+
  coord_cartesian(expand = FALSE, xlim=c(0,4), ylim=c(0,2)) +
  geom_segment(color=sky$color, linewidth = sky$linewidth)+
  geom_point(data=moon, aes(x,y), color=moon$color, fill=moon$fill,
             size=moon$size, shape = 21, stroke = 0.5, inherit.aes = FALSE)