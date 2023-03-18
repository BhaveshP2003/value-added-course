# Importing Dataset
Supermarket_sales <- read.csv("supermarket_sales.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Supermarket_sales)

# Datatypes Check
str(Supermarket_sales)

# Datatype Conversion
Supermarket_sales$Gender <- as.factor(Supermarket_sales$Gender)
Supermarket_sales$Customer <- as.factor(Supermarket_sales$Customer)
Supermarket_sales$Payment <- as.factor(Supermarket_sales$Payment)
Supermarket_sales$Branch <- as.factor(Supermarket_sales$Branch)

# Datatypes Recheck
str(Supermarket_sales)

# Express Table for people Payment
prop.table(table(Supermarket_sales$Payment))

# Importing Library
library(ggplot2)


# People Payment Count Bar graph
ggplot(Supermarket_sales, aes(x = Payment)) + theme_classic() + 
  geom_bar() + 
  labs(y = "People count", title = "Supermarket_sales Payment Count")


# Gender wise payment Plot
ggplot(Supermarket_sales, aes(x = Gender, fill = Payment)) + theme_light() + 
  geom_bar() + 
  labs(y = "People count", 
       title = "Supermarket_sales payment Count by gender")


# Plot for payment based on customer
ggplot(Supermarket_sales, aes(x = Customer, fill = Payment)) + theme_light() + 
  geom_bar() + 
  labs(y = "People count", 
       title = "Supermarket_sales payment Count by customer")


# Plot for gender based payment from each customer
ggplot(Supermarket_sales, aes(x = Gender, fill = Payment)) + theme_light() + 
  facet_grid(~Customer) + geom_bar() + 
  labs(y = "People count", 
       title = "Supermarket_sales payment Count by customer and gender")


# Pie chart for payment ratio in each customer
ggplot(Supermarket_sales, aes(x = "", fill = Payment)) + 
  geom_bar(position = "fill") + 
  facet_grid(~Customer) + coord_polar(theta = "y")


# Plot for Quantity group distribution
ggplot(Supermarket_sales, aes(x = Quantity, fill = Payment)) + 
  theme_bw() + geom_histogram(binwidth = 5) +
  labs(y = "People count", x = "Quantity", 
       title = "Supermarket_sales Quantity distribution")


# Box Plot for payment rate by Quantity
ggplot(Supermarket_sales, aes(x = Payment, y = Quantity)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "Quantity", x = "Payment", 
       title = "Supermarket_sales payment  by Quantity")


# Density plot
ggplot(Supermarket_sales, aes(x = Quantity, fill = Payment)) + theme_bw() + 
  facet_wrap(Gender~Customer) + geom_density(alpha = 0.5) + 
  labs(y = "Quantity", x = "Payment", 
       title = "Supermarket_sales rate by Quantity, customer and gender")