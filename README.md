## Notes on Data

To create the graph, we need to include the person's birthday for the x-axis (age) and to be able to compare age differences between their opponent (the y-axis).

Checking through the JS file showed there wasn't any personal birthday. However, the Tennis Abstract website has data on each player as YYYYMMDD.

However, the links aren't the same for women and men, as women have "wplayer" in the url while men are just listed as "player". The way we can check for this before trying the link is through the JS files, specifically looking for how the ages are presented. In the men's data, the opponent's age is shown as a number and decimal, like 30.355 years old. In the women's, it's a date of birth using YYYYMMDD.