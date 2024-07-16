library(readr)
library(ggplot2)

weather_data <- read_csv(file.choose())

# Selecting the top 10 entries for simplified view
top_10_data <- weather_data[1:10, ]

#ggplot
ggplot(top_10_data, aes(x = `Apparent Temperature (C)`, y = `Temperature (C)`)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, color = "blue", se = FALSE) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "red", se = FALSE) +
  labs(title = "Temperature vs Apparent Temperature (Top 10 Entries)",
       x = "Apparent Temperature (C)",
       y = "Temperature (C)") +
  theme_minimal()
