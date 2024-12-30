# Load required libraries
library(dplyr)
library(ggplot2)

# Create a sample dataset
data <- data.frame(
  Product = c('A', 'B', 'C', 'D'),
  Sales_Q1 = c(100, 200, 150, 300),
  Sales_Q2 = c(110, 190, 160, 310),
  Category = c('Electronics', 'Clothing', 'Electronics', 'Clothing')
)

# Add total sales and growth percentage columns
data <- data %>%
  mutate(
    Total_Sales = Sales_Q1 + Sales_Q2,
    Growth_Percent = ((Sales_Q2 - Sales_Q1) / Sales_Q1) * 100
  )

# Calculate average total sales by category
category_sales <- data %>%
  group_by(Category) %>%
  summarise(Avg_Total_Sales = mean(Total_Sales))

# Plot total sales by product
ggplot(data, aes(x = Product, y = Total_Sales, fill = Product)) +
  geom_bar(stat = "identity") +
  ggtitle("Total Sales by Product") +
  xlab("Product") +
  ylab("Total Sales") +
  theme_minimal()

# Print results
print("Original DataFrame:")
print(data)

print("\nCategory-wise Average Total Sales:")
print(category_sales)

# Save results to a CSV file
write.csv(data, "sales_analysis.csv", row.names = FALSE)
print("\nResults saved to sales_analysis.csv")
