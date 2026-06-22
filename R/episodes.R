#' Rick Steves' Europe episodes
#'
#' One row per episode of the public-television travel series
#' *Rick Steves' Europe* (2000-2025), 159 episodes across 13 seasons.
#' Editorial fields (`title`, `synopsis`, `theme_tags`, `region`,
#' `primary_destination`, `episode_type`, `is_retired`) are curated; the
#' rest are derived from public sources and joined back on
#' `(season, episode_in_season)` or on the IMDB title id.
#'
#' This dataset was compiled from public sources for teaching purposes and
#' is not an official or verified Rick Steves' Europe dataset. It is shared
#' with the permission of the Rick Steves' Europe team.
#'
#' @format A tibble with 159 rows and 38 columns:
#' \describe{
#'   \item{overall_episode}{Integer. Series-wide episode number, 1--159.}
#'   \item{season}{Integer. Season, 1--13.}
#'   \item{episode_in_season}{Integer. Episode within season.}
#'   \item{season_episode_code}{Character. `"S01E01"` style code.}
#'   \item{title}{Character. Episode title (Rick Steves' canonical wording).}
#'   \item{synopsis}{Character. One-line editorial summary.}
#'   \item{theme_tags}{Character. Semicolon-separated themes, e.g.
#'     `"Food & Cuisine; History & Heritage"`.}
#'   \item{episode_type}{Character. `"Standard"` or a special category.}
#'   \item{is_retired}{Character. `"Yes"` if the video has been pulled from
#'     ricksteves.com, `"No"` otherwise.}
#'   \item{primary_country}{Character. Main country featured.}
#'   \item{all_countries}{Character. Semicolon-separated list of countries
#'     when the episode covers more than one.}
#'   \item{region}{Character. Show-specific region label, e.g. `"Iberia"`,
#'     `"British Isles"`, `"Mediterranean"`.}
#'   \item{primary_destination}{Character. Main destination string used for
#'     geocoding.}
#'   \item{iso2}{Character. ISO 3166-1 alpha-2 country code, or `"ZZ"` for
#'     multi-country compilation episodes.}
#'   \item{flag}{Character. Country flag emoji derived from `iso2`; the
#'     globe emoji for multi-country rows.}
#'   \item{lat, long}{Numeric. WGS84 decimal degrees of the destination.
#'     For multi-country rows, the unweighted centroid of capital cities
#'     listed in `all_countries`. `NA` when no single coordinate is
#'     meaningful (e.g. travel-skills compilations).}
#'   \item{geo_match}{Character. How the coordinate was resolved:
#'     `"full"` = exact destination, `"simple"` = first place name,
#'     `"country"` = country fallback, `"centroid"` = capital centroid.}
#'   \item{original_air_date}{Date. Original PBS air date.}
#'   \item{air_year, air_month, air_weekday}{Year (integer), abbreviated
#'     month, abbreviated weekday derived from `original_air_date`.}
#'   \item{days_since_premiere}{Integer. Days since the series premiered on
#'     2000-09-03.}
#'   \item{gap_since_prev_episode_d}{Integer. Days since the previous
#'     episode aired, in chronological order.}
#'   \item{imdb_tconst}{Character. IMDB title id, e.g. `"tt1453776"`.}
#'   \item{imdb_url}{Character. Direct link to the episode on IMDB.}
#'   \item{imdb_rating}{Numeric. Raw IMDB user rating (1--10), `NA` for
#'     episodes with no votes recorded.}
#'   \item{imdb_votes}{Integer. Number of user votes on IMDB.}
#'   \item{imdb_rating_shrunk}{Numeric. Bayesian-shrunk rating that pulls
#'     low-vote ratings toward the show mean (~7.75); always populated.
#'     Recommended for sorting/ranking when vote counts are uneven.}
#'   \item{imdb_low_votes}{Logical. `TRUE` when `imdb_votes < 10`; flag for
#'     UIs to show a "few votes" caveat.}
#'   \item{image_url}{Character. Episode hero image (mostly YouTube
#'     thumbnails extracted from ricksteves.com `og:image`). `NA` for
#'     retired episodes whose pages were removed.}
#'   \item{image_source}{Character. Provenance of `image_url`:
#'     `"ricksteves.com"`, `"tvmaze"`, or `"wayback"`.}
#'   \item{best_summary}{Character. Richest available description
#'     (ricksteves.com `og:description` > TVmaze summary > `synopsis`).
#'     Always populated.}
#'   \item{summary_source}{Character. Provenance of `best_summary`.}
#'   \item{best_runtime}{Integer. Runtime in minutes (canonical PBS slot,
#'     usually 26).}
#'   \item{watch_url}{Character. Streaming URL on ricksteves.com, where
#'     available.}
#'   \item{tvmaze_url, tvmaze_id}{TVmaze episode page and numeric id; useful
#'     as a secondary deep link or to call the TVmaze API.}
#' }
#'
#' @source
#' Source: Rick Steves' Europe (compiled dataset). Compiled from public
#' sources for teaching purposes; not an official or verified Rick Steves'
#' Europe dataset.
#'
#' - Editorial fields curated from <https://www.ricksteves.com/>
#' - IMDB ratings from <https://datasets.imdbws.com/> (non-commercial use).
#' - Geocoding via OpenStreetMap Nominatim through the
#'   \href{https://CRAN.R-project.org/package=tidygeocoder}{tidygeocoder}
#'   package.
#' - Episode metadata from <https://api.tvmaze.com/shows/9872> and
#'   <https://en.wikipedia.org/wiki/Rick_Steves%27_Europe>.
#'
#' @examples
#' library(steves)
#' head(episodes)
#'
#' if (requireNamespace("dplyr", quietly = TRUE)) {
#'   dplyr::count(episodes, primary_country, sort = TRUE)
#' }
"episodes"
