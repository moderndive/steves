## R CMD check results

0 errors | 0 warnings | 1 note

* This is an update to a package already on CRAN.

## Notes

* The possibly misspelled words flagged in DESCRIPTION (IMDB, Steves,
  geocoded) are all spelled correctly: "IMDB" is the Internet Movie
  Database, "Steves" is the surname in the series title *Rick Steves'
  Europe*, and "geocoded" is the standard term for the destination
  coordinates derived for the dataset.

## Data provenance

`steves` is a data package: one row per episode of the public-television
series *Rick Steves' Europe*. The bundled fields combine the maintainer's own
curated editorial fields with values derived from public sources (IMDB
non-commercial datasets, OpenStreetMap/Nominatim geocoding, TVmaze, and
Wikipedia). Episode descriptions and image URLs originate from
ricksteves.com and are included with the permission of the Rick Steves'
Europe team for educational use. The dataset is documented as compiled from
public sources and is not an official or verified Rick Steves' Europe
dataset.

## Test environments

* local macOS, R release
* GitHub Actions: macOS, Windows, Ubuntu (devel, release, oldrel-1)
