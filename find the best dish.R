library(tidyverse)

epi_r <- read.csv(file.choose())

head(epi_r)
summary(epi_r)

ggplot(epi_r, aes(x = rating)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
  ggtitle("Distribution of Recipe Ratings") +
  xlab("Rating") +
  ylab("Frequency")

veg_cols <- grep("vegetarian", names(epi_r), value = TRUE, ignore.case = TRUE)

if (length(veg_cols) > 0) {
  epi_r$is_vegetarian <- ifelse(epi_r$vegetarian == 1, TRUE, FALSE)
  
  # Plot of vegetarian and non-vegetarian recipes
  ggplot(epi_r, aes(x = factor(is_vegetarian, levels = c(FALSE, TRUE), labels = c("Non-Vegetarian", "Vegetarian")))) +
    geom_bar(fill = "green", alpha = 0.7) +
    ggtitle("Composition of Vegetarian and Non-Vegetarian Recipes") +
    xlab("Recipe Type") +
    ylab("Count")
} else {
  print("No vegetarian-related columns found.")
}

ggplot(epi_r, aes(x = calories, y = rating)) +
  geom_point(alpha = 0.5) +
  ggtitle("Relation Between Rating and Calorie Content") +
  xlab("Calories") +
  ylab("Rating")

nutritional_cols <- c("calories", "protein", "fat", "sodium")

cor_matrix <- cor(epi_r[, c("rating", nutritional_cols)], use = "complete.obs")

print(cor_matrix)

#Composition of Vegetarian and Non-Vegetarian Recipes in 5-Star Ratings
five_star_recipes <- epi_r %>% filter(rating == 5)

if (length(veg_cols) > 0) {
  ggplot(five_star_recipes, aes(x = factor(is_vegetarian, levels = c(FALSE, TRUE), labels = c("Non-Vegetarian", "Vegetarian")))) +
    geom_bar(fill = "red", alpha = 0.7) +
    ggtitle("Composition of Vegetarian and Non-Vegetarian Recipes in 5-Star Ratings") +
    xlab("Recipe Type") +
    ylab("Count")
} else {
  print("No vegetarian-related columns found.")
}

#Common Fruits Used in 5-Star Rated Recipes
fruit_cols <- grep("fruit", names(epi_r), value = TRUE, ignore.case = TRUE)

if (length(fruit_cols) > 0) {
  fruit_usage <- colSums(five_star_recipes[, fruit_cols], na.rm = TRUE)
  
  print(sort(fruit_usage, decreasing = TRUE))
} else {
  print("No fruit-related columns found.")
}

#Find Low-Calorie, High-Protein Recipes
low_cal_high_protein_recipes <- epi_r %>%
  filter(calories < quantile(calories, 0.25, na.rm = TRUE) & 
           protein > quantile(protein, 0.75, na.rm = TRUE) &
           rating >= 4)

low_cal_high_protein_recipes %>%
  select(title, calories, protein, rating) %>%
  arrange(desc(rating))
