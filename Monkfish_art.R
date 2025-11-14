# A silly R plot that *looks like a monkfish*
# This uses ggplot2 shapes, polygons, and annotations to fake a monkfish silhouette.

library(ggplot2)
library(dplyr)

plot_monkfish_shape <- function() {
  
  # Body polygon (blobby monkfish shape)
  body <- tibble(
    x = c(-2, -1, 0, 1.2, 1.8, 1.5, 0.5, -0.5, -1.3, -2),
    y = c(0, 1.2, 1.6, 1.2, 0, -0.8, -1.4, -1.3, -0.6, 0)
  )
  
  # Tail
  tail <- tibble(
    x = c(1.8, 2.4, 2.4, 1.8),
    y = c(0.1, 0.6, -0.6, -0.1)
  )
  
  # Eyes
  eyes <- tibble(
    x = c(-1, -0.4),
    y = c(0.6, 0.7)
  )
  
  # Teeth as small downward triangles
  teeth <- tibble(
    x = seq(-0.5, 0.5, length.out = 10),
    y = rep(-0.2, 10)
  )
  
  ggplot() +
    geom_polygon(data = body, aes(x, y), fill = "#d9a066", color = "black", linewidth = 1.2) +
    geom_polygon(data = tail, aes(x, y), fill = "#b07a44", color = "black", linewidth = 1) +
    geom_point(data = eyes, aes(x, y), size = 6, shape = 21, fill = "white") +
    geom_point(data = eyes, aes(x, y), size = 3) +
    geom_point(data = teeth, aes(x, y), shape = 25, size = 3, fill = "white") +
    annotate("text", x = 0, y = 1.9, label = "Monkfish", size = 8, family = "Comic Sans MS") +
    coord_equal() +
    theme_void() +
    theme(plot.margin = margin(40,40,40,40))
}

# Example:
p <- plot_monkfish_shape()
print(p)