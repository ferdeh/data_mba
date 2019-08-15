library(tidyverse)
?mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

plot(mpg$displ,mpg$hwy)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = cty))