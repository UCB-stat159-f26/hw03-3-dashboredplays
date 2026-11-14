# tennisplot Package

This is a R package that gets data on a specified tennis player's career matches from the website tennisabstract.com, and plots the player's age versus the opponent's age difference, colored by win/loss. Graph inspired by the NYT article https://www.nytimes.com/2022/09/08/learning/whats-going-on-in-this-graph-sept-14-2022.html.

## Installation
```r
devtools::install_github("UCB-stat159-f26/hw03-3-dashboredplays")
```

## How to Use

Run these through an R terminal:
```r
library(tennisplot)

# An example, using Rafael Nadal
rafa <- get_player_matches("Rafael Nadal")
plot_player_matches(rafa)

# An example of an entry that doesn't work
unknown_player <- get_player_matches("GastonSanchez")
```

## Notes on Data

To create the graph, we need to include the person's birthday for the x-axis (age) and to be able to compare age differences between their opponent (the y-axis).

Checking through the JS file showed there wasn't any personal birthday. However, the Tennis Abstract website has data on each player as YYYYMMDD.

However, the links aren't the same for women and men, as women have "wplayer" in the url while men are just listed as "player". The way we can check for this before trying the link is through the JS files, specifically looking for how the ages are presented. In the men's data, the opponent's age is shown as a number and decimal, like 30.355 years old. In the women's, it's a date of birth using YYYYMMDD.

## Reflection

Data wise, I intially came into the assignment expecting a pipeline that could easily be built due to ready-to-go data. However as the project showed, there were small issues in the data that had to be managed.

When it came to working through the assignment, I found it somewhat tricky to deliberately commit after each set of changes. I felt that I had to plan out a lot of what I was going to do, what I should've left in vs save for the next commit, etc.

In general though, it was cool actually building out a package and actually seeing it work just like other packages like dplyr or ggplot.