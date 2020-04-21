#### BasicStats.R

# Code for Chapter 2
# Uses concepts that will be covered in later chapters

# Creating vectors for all seasons
got_season1 <- c(9.1, 8.8, 8.7, 8.8, 9.1, 9.2, 9.2, 9, 9.6, 9.5)
got_season7 <- c(8.6, 8.9, 9.2, 9.8, 8.8, 9, 9.4)
got_season8 <- c(7.6, 7.9, 7.5, 5.5, 6.0, 4.1)

# Make a list containing all three vectors
all <- list(got_season1, got_season7, got_season8)

# Create basic printf
printf <- function(...) invisible(print(sprintf(...)))

# For loop to iterate through season and print output
i <- 1
for (season in all) {
  if (i == 2)
    i = 7
  cur_mean <- mean(season)
  cur_median <- median(season)
  cur_range <- diff(range(season))
  printf("Season %d\nMean: %fMedian: %f\nRange: %f\n",
         i, cur_mean, cur_median, cur_range)
  i <- i + 1
}