format_player_name <- function(player_name) {
  tolower(gsub(" ", "", player_name))
}

career_js_url <- function(player_id) {
  paste0("https://www.tennisabstract.com/jsmatches/", player_id, "Career.js")
}

download_text <- function(url, player_name) {
  fail <- function(e) {
    stop("Player name '", player_name, "' not found on tennisabstract.com. ", call. = FALSE) # call = FALSE is so R doesn't print function name
  }
  tryCatch(readLines(url, warn = FALSE), error = fail, warning = fail)
}