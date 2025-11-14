library(ggplot2)
library(palmerpenguins)
library(dplyr)
library(ggtext)
library(scales)

plot_fun_penguins <- function() {
  penguins_clean <- penguins %>%
    filter(!is.na(bill_length_mm), !is.na(flipper_length_mm), !is.na(species))
  
  ggplot(penguins_clean, aes(x = bill_length_mm, y = flipper_length_mm, color = species)) +
    geom_point(size = 3.8, alpha = 0.85) +
    geom_smooth(method = "loess", se = FALSE, linewidth = 1.1, linetype = "longdash") +
    scale_color_manual(values = c("#FFB347", "#FF8C00", "#FF7F50")) +
    scale_x_continuous(name = "Bill Length (mm)", breaks = pretty_breaks()) +
    scale_y_continuous(name = "Flipper Length (mm)", breaks = pretty_breaks()) +
    coord_cartesian(clip = "off") +
    theme_minimal(base_size = 15) +
    theme(
      panel.grid.major = element_line(color = "grey85", linewidth = 0.3),
      panel.grid.minor = element_blank(),
      plot.title = element_markdown(size = 20, face = "bold", margin = margin(b = 8)),
      plot.subtitle = element_markdown(size = 13, color = "grey30", margin = margin(b = 15)),
      legend.position = "top",
      legend.title = element_text(face = "bold"),
      legend.text = element_text(size = 11)
    ) +
    labs(
      title = "<span style='color:#FF8C00;'>Advanced Penguin Visualization</span>",
      subtitle = "Relationships between **bill length** and **flipper length** for three penguin species",
      color = "Species"
    )
}

p <- plot_fun_penguins()
print(p)
