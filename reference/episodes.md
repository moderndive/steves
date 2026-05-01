# Rick Steves' Europe episodes

One row per episode of the public-television travel series *Rick Steves'
Europe* (2000-2025), 159 episodes across 13 seasons. Editorial fields
(`title`, `synopsis`, `theme_tags`, `region`, `primary_destination`,
`episode_type`, `is_retired`) are curated; the rest are derived from
public sources and joined back on `(season, episode_in_season)` or on
the IMDB title id.

## Usage

``` r
episodes
```

## Format

A tibble with 159 rows and 38 columns:

- overall_episode:

  Integer. Series-wide episode number, 1–159.

- season:

  Integer. Season, 1–13.

- episode_in_season:

  Integer. Episode within season.

- season_episode_code:

  Character. `"S01E01"` style code.

- title:

  Character. Episode title (Rick Steves' canonical wording).

- synopsis:

  Character. One-line editorial summary.

- theme_tags:

  Character. Semicolon-separated themes, e.g.
  `"Food & Cuisine; History & Heritage"`.

- episode_type:

  Character. `"Standard"` or a special category.

- is_retired:

  Character. `"Yes"` if the video has been pulled from ricksteves.com,
  `"No"` otherwise.

- primary_country:

  Character. Main country featured.

- all_countries:

  Character. Semicolon-separated list of countries when the episode
  covers more than one.

- region:

  Character. Show-specific region label, e.g. `"Iberia"`,
  `"British Isles"`, `"Mediterranean"`.

- primary_destination:

  Character. Main destination string used for geocoding.

- iso2:

  Character. ISO 3166-1 alpha-2 country code, or `"ZZ"` for
  multi-country compilation episodes.

- flag:

  Character. Country flag emoji derived from `iso2`; the globe emoji for
  multi-country rows.

- lat, long:

  Numeric. WGS84 decimal degrees of the destination. For multi-country
  rows, the unweighted centroid of capital cities listed in
  `all_countries`. `NA` when no single coordinate is meaningful (e.g.
  travel-skills compilations).

- geo_match:

  Character. How the coordinate was resolved: `"full"` = exact
  destination, `"simple"` = first place name, `"country"` = country
  fallback, `"centroid"` = capital centroid.

- original_air_date:

  Date. Original PBS air date.

- air_year, air_month, air_weekday:

  Year (integer), abbreviated month, abbreviated weekday derived from
  `original_air_date`.

- days_since_premiere:

  Integer. Days since the series premiered on 2000-09-03.

- gap_since_prev_episode_d:

  Integer. Days since the previous episode aired, in chronological
  order.

- imdb_tconst:

  Character. IMDB title id, e.g. `"tt1453776"`.

- imdb_url:

  Character. Direct link to the episode on IMDB.

- imdb_rating:

  Numeric. Raw IMDB user rating (1–10), `NA` for episodes with no votes
  recorded.

- imdb_votes:

  Integer. Number of user votes on IMDB.

- imdb_rating_shrunk:

  Numeric. Bayesian-shrunk rating that pulls low-vote ratings toward the
  show mean (~7.75); always populated. Recommended for sorting/ranking
  when vote counts are uneven.

- imdb_low_votes:

  Logical. `TRUE` when `imdb_votes < 10`; flag for UIs to show a "few
  votes" caveat.

- image_url:

  Character. Episode hero image (mostly YouTube thumbnails extracted
  from ricksteves.com `og:image`). `NA` for retired episodes whose pages
  were removed.

- image_source:

  Character. Provenance of `image_url`: `"ricksteves.com"`, `"tvmaze"`,
  or `"wayback"`.

- best_summary:

  Character. Richest available description (ricksteves.com
  `og:description` \> TVmaze summary \> `synopsis`). Always populated.

- summary_source:

  Character. Provenance of `best_summary`.

- best_runtime:

  Integer. Runtime in minutes (canonical PBS slot, usually 26).

- watch_url:

  Character. Streaming URL on ricksteves.com, where available.

- tvmaze_url, tvmaze_id:

  TVmaze episode page and numeric id; useful as a secondary deep link or
  to call the TVmaze API.

## Source

- Editorial fields curated from <https://www.ricksteves.com/>

- IMDB ratings from <https://datasets.imdbws.com/> (non-commercial use).

- Geocoding via OpenStreetMap Nominatim through the
  [tidygeocoder](https://CRAN.R-project.org/package=tidygeocoder)
  package.

- Episode metadata from <https://api.tvmaze.com/shows/9872> and
  <https://en.wikipedia.org/wiki/Rick_Steves%27_Europe>.

## Examples

``` r
library(steves)
head(episodes)
#> # A tibble: 6 × 38
#>   overall_episode season episode_in_season season_episode_code title    synopsis
#>             <int>  <int>             <int> <chr>               <chr>    <chr>   
#> 1               1      1                 1 S01E01              Portuga… Portuga…
#> 2               2      1                 2 S01E02              Paris: … Paris; …
#> 3               3      1                 3 S01E03              South E… Souther…
#> 4               4      1                 4 S01E04              Heart o… A trip …
#> 5               5      1                 5 S01E05              Caesar'… Rome; F…
#> 6               6      1                 6 S01E06              Germany… A class…
#> # ℹ 32 more variables: theme_tags <chr>, episode_type <chr>, is_retired <chr>,
#> #   primary_country <chr>, all_countries <chr>, region <chr>,
#> #   primary_destination <chr>, iso2 <chr>, flag <chr>, lat <dbl>, long <dbl>,
#> #   geo_match <chr>, original_air_date <date>, air_year <int>, air_month <ord>,
#> #   air_weekday <ord>, days_since_premiere <int>,
#> #   gap_since_prev_episode_d <int>, imdb_tconst <chr>, imdb_url <chr>,
#> #   imdb_rating <dbl>, imdb_votes <int>, imdb_rating_shrunk <dbl>, …

if (requireNamespace("dplyr", quietly = TRUE)) {
  dplyr::count(episodes, primary_country, sort = TRUE)
}
#> # A tibble: 31 × 2
#>    primary_country     n
#>    <chr>           <int>
#>  1 Italy              29
#>  2 Multiple           20
#>  3 United Kingdom     20
#>  4 France             15
#>  5 Germany             9
#>  6 Spain               9
#>  7 Turkey              6
#>  8 Austria             4
#>  9 Greece              4
#> 10 Portugal            4
#> # ℹ 21 more rows
```
