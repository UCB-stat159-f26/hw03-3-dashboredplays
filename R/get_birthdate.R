in_dob_format <- function(values) {
  values <- values[values != ""]
  all(grepl("^[0-9]{8}$", values))
}

player_profile_url <- function(player_id, female) {
  page <- if (female) "wplayer.cgi" else "player.cgi"
  paste0("https://www.tennisabstract.com/cgi-bin/", page, "?p=", player_id)
}

# below function broken out in sandbox
get_page_var <- function(page_text, var_name) {
  dob_pattern <- paste0("var ", var_name, " = '?([^';\n]+)")
  match <- regmatches(page_text, regexec(dob_pattern, page_text))[[1]]
  if (length(match) == 0) stop("Could not find '", var_name, "' on the player page.")
  match[2]
}