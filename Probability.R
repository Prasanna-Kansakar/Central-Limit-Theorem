remove(list = ls())

# Load necessary libraries
library(ggplot2)

# Set parameters
set.seed(123)               # For reproducibility
num_rolls <- 10000          # Number of dice rolls
dice_sides <- 6             # Number of sides on the dice

# Function to simulate dice rolls and visualize the distribution
simulate_dice_rolls <- function(bias = NULL) {
  if (is.null(bias)) {
    # Fair dice roll (uniform distribution)
    rolls <- sample(1:dice_sides, num_rolls, replace = TRUE)
    title <- "Fair Dice Roll Distribution (Uniform)"
  } else {
    # Biased dice roll
    probabilities <- rep((1 - bias) / (dice_sides - 1), dice_sides)
    probabilities[1] <- bias  # Bias for side "1"
    rolls <- sample(1:dice_sides, num_rolls, replace = TRUE, prob = probabilities)
    title <- "Biased Dice Roll Distribution"
  }

  # Plot the initial distribution (PMF)
  roll_data <- as.data.frame(table(rolls) / num_rolls)
  colnames(roll_data) <- c("Roll", "Probability")
  ggplot(roll_data, aes(x = as.numeric(Roll), y = Probability)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    labs(title = title, x = "Dice Roll Outcome", y = "Probability") +
    theme_minimal()
}

# Apply Central Limit Theorem by averaging samples and plot the distribution
apply_clt <- function(rolls, sample_size = 30, num_samples = 1000) {
  sample_means <- replicate(num_samples, mean(sample(rolls, sample_size, replace = TRUE)))

  # Plot the distribution of sample means
  ggplot(data.frame(SampleMeans = sample_means), aes(x = SampleMeans)) +
    geom_histogram(aes(y = ..density..), bins = 30, fill = "lightgreen", color = "black") +
    stat_function(fun = dnorm, args = list(mean = mean(sample_means), sd = sd(sample_means)),
                  color = "blue", size = 1) +
    labs(title = "Central Limit Theorem - Distribution of Sample Means",
         x = "Sample Means", y = "Density") +
    theme_minimal()
}

# Simulate and plot fair dice roll distribution
fair_rolls <- sample(1:dice_sides, num_rolls, replace = TRUE)
print(simulate_dice_rolls())

# Apply CLT to fair dice rolls and plot
print(apply_clt(fair_rolls))

# Simulate and plot biased dice roll distribution (e.g., 50% chance of rolling a '1')
biased_rolls <- sample(1:dice_sides, num_rolls, replace = TRUE, prob = c(0.5, rep(0.1, dice_sides - 1)))
print(simulate_dice_rolls(bias = 0.5))

# Apply CLT to biased dice rolls and plot
print(apply_clt(biased_rolls))
