# Build data/episodes.rda from data-raw/episodes.csv.
#
# Drop the latest episodes.csv into this folder and rerun this script to
# refresh the package.

library(readr)

episodes <- read_csv(
  "data-raw/episodes.csv",
  show_col_types = FALSE,
  col_types = cols(
    overall_episode          = col_integer(),
    season                   = col_integer(),
    episode_in_season        = col_integer(),
    original_air_date        = col_date(),
    air_year                 = col_integer(),
    days_since_premiere      = col_integer(),
    gap_since_prev_episode_d = col_integer(),
    imdb_votes               = col_integer(),
    best_runtime             = col_integer(),
    tvmaze_id                = col_integer(),
    imdb_low_votes           = col_logical(),
    .default                 = col_guess()
  )
)

# Force month/weekday back to ordered factors (read_csv reads them as char).
episodes$air_month   <- factor(episodes$air_month,
                               levels = c("Jan","Feb","Mar","Apr","May","Jun",
                                          "Jul","Aug","Sep","Oct","Nov","Dec"),
                               ordered = TRUE)
episodes$air_weekday <- factor(episodes$air_weekday,
                               levels = c("Sun","Mon","Tue","Wed","Thu",
                                          "Fri","Sat"),
                               ordered = TRUE)

usethis::use_data(episodes, overwrite = TRUE, compress = "xz")

message(sprintf("Built episodes: %d rows, %d cols",
                nrow(episodes), ncol(episodes)))
