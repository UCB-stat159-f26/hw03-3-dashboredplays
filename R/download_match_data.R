format_player_name <- function(player_name) {
  tolower(gsub(" ", "", player_name))
}

career_js_url <- function(player_id) {
  paste0("https://www.tennisabstract.com/jsmatches/", player_id, "Career.js")
}