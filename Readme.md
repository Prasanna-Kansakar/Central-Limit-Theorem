# README

## Overview
This R script simulates dice rolls to explore the distribution of outcomes and applies the Central Limit Theorem (CLT) to analyze the behavior of sample means. It includes simulations for both fair and biased dice rolls and generates visualizations for better understanding.

## Features
1. **Simulate Fair Dice Rolls:**
    - Rolls a dice with equal probabilities for all sides and visualizes the outcome distribution.

2. **Simulate Biased Dice Rolls:**
    - Rolls a dice with a specified bias (higher probability for a particular side) and visualizes the outcome distribution.

3. **Central Limit Theorem Application:**
    - Demonstrates the CLT by sampling means from dice roll data and visualizing the resulting normal distribution.

4. **Visualization:**
    - Probability mass function (PMF) for dice rolls.
    - Histogram of sample means with overlayed normal distribution.

## Prerequisites
- **Required R Package:**
    - `ggplot2`

- **Installation:**
  ```R
  install.packages("ggplot2")
  ```

## Instructions
1. **Load Required Libraries:**
    - Ensure `ggplot2` is installed.

2. **Run the Script:**
    - Execute the script to simulate and visualize the distributions.
    - Customize parameters like `num_rolls`, `dice_sides`, and `bias` for different scenarios.

3. **Outputs:**
    - Plots of dice roll distributions (fair and biased).
    - Histograms demonstrating the CLT with sample means.

## Example Usage
```R
# Simulate and plot fair dice roll distribution
print(simulate_dice_rolls())

# Apply CLT to fair dice rolls
fair_rolls <- sample(1:6, 10000, replace = TRUE)
print(apply_clt(fair_rolls))

# Simulate and plot biased dice roll distribution (50% chance for '1')
print(simulate_dice_rolls(bias = 0.5))

# Apply CLT to biased dice rolls
biased_rolls <- sample(1:6, 10000, replace = TRUE, prob = c(0.5, rep(0.1, 5)))
print(apply_clt(biased_rolls))
```

