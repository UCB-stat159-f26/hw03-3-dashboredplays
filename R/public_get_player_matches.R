get_player_matches <- function(name) {
  player_id <- format_player_name(name)
  career_js <- download_text(career_js_url(player_id), name)
  mat <- parse_career_js(career_js)
  is_female <- in_dob_format(mat[, 17])
  profile <- download_text(player_profile_url(player_id, is_female), name)
  clean_matches(mat, get_page_var(profile, "dob"), get_page_var(profile, "fullname"))
}

# 1. Change name to be correct format (no spaces, all lowercase)
# 2. Create full url link and get the text
# 3. Make data useable from var morematchmx format
# 4. Check column 17 to see data type to determine if female or male
# 5. Build link for player profile and get the data
# 6. Get the name and date of birth, and create columns on age differences for plotting