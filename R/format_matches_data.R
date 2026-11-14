# functions built up from HW2
# more documentation shown in README.md
parse_career_js <- function(js_text) {
  raw <- paste(js_text, collapse = "")
  rows <- regmatches(raw, gregexpr("\\[[^][]*\\]", raw))[[1]]
  do.call(rbind, lapply(rows, function(r) gsub("\"", "", regmatches(r, gregexpr("\"[^\"]*\"", r))[[1]])[1:17])) # Want to normalize rows and only need first 17 columns
}

# changes to age in decimal format
opponent_age <- function(dates, col17) {
  if (in_dob_format(col17)) {
    return(as.numeric(dates - as.Date(col17, "%Y%m%d")) / 365.25)
  }
  as.numeric(col17)
}

clean_matches <- function(mat, player_dob, player_name) {
  dates <- as.Date(mat[, 1], "%Y%m%d")
  player_age <- as.numeric(dates - as.Date(player_dob, "%Y%m%d")) / 365.25 # include the .25 because there's leap years
  data.frame(
    player = player_name,
    result = mat[, 5],
    player_age = player_age,
    age_diff = player_age - opponent_age(dates, mat[, 17])
  )
}