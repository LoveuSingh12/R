library(dplyr)
library(ggplot2)

file_path <- file.choose()
candy_data <- read.csv(file_path)

head(candy_data)

correlation_matrix <- cor(candy_data %>% select(-competitorname))

winpercent_correlation <- correlation_matrix[, "winpercent"] %>% sort(decreasing = TRUE)
print("Correlation with Win Percentage:")
print(winpercent_correlation)

top5_correlation <- head(winpercent_correlation, 5)
least5_correlation <- tail(winpercent_correlation, 5)

correlation_df <- data.frame(
  Attribute = names(c(top5_correlation, least5_correlation)),
  Correlation = c(top5_correlation, least5_correlation)
)

correlation_plot <- ggplot(correlation_df, aes(x = reorder(Attribute, Correlation), y = Correlation)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 5 and Least 5 Correlations with Win Percentage", x = "Attribute", y = "Correlation")

print(correlation_plot)

#Most popular candy: -
most_popular_candy <- candy_data %>% filter(winpercent == max(winpercent))
print("Most Popular Candy:")
print(most_popular_candy)

#Least popular candy: -
least_popular_candy <- candy_data %>% filter(winpercent == min(winpercent))
print("Least Popular Candy:")
print(least_popular_candy)

sorted_candy_data <- candy_data %>% arrange(desc(winpercent))

top5_candies <- head(sorted_candy_data, 5)
least5_candies <- tail(sorted_candy_data, 5)

candy_df <- rbind(top5_candies, least5_candies)

#Bar Plot
popular_candy_plot <- ggplot(candy_df, 
                             aes(x = reorder(competitorname, winpercent),
                                 y = winpercent)) +
  geom_bar(stat = "identity", fill = "orange") +
  coord_flip() +
  labs(title = "Top 5 and Least 5 Popular Candies", 
       x = "Candy", y = "Win Percentage")

print(popular_candy_plot)

#Qualities associated with higher rankings: -
qualities_high_rank <- names(top5_correlation)
print("Qualities associated with higher rankings:")
print(qualities_high_rank)