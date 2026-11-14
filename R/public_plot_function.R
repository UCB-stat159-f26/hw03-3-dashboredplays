plot_player_matches <- function(matches) {
  ggplot2::ggplot(matches, aes(x = player_age, y = age_diff, color = result)) + 
  ggplot2::geom_point() +
  ggplot2::scale_color_manual(
    name   = "Result",
    values = c("W" = "skyblue", "L" = "purple"),
    labels = c("L" = "Match lost", "W" = "Match won")
  ) +
  ggplot2::labs(title = paste0(player, "'s Professional Matches"), 
    x = paste0(player, "'s age"), y = "Opponent Age Difference") +
  ggplot2::theme_bw()
}