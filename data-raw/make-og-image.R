# Build the social-share (Open Graph) card: 1200x630, featuring the hex.
# Output: man/figures/og-image.png (referenced from _pkgdown.yml).
suppressMessages(library(magick))

W <- 1200L
H <- 630L
blue   <- "#1B3A6B"  # primary
gold   <- "#FFC72C"  # secondary
ltblue <- "#E8F0FA"
sky    <- "#5DA9E9"

# Canvas
canvas <- image_blank(W, H, color = blue)

# Hex sticker on the right, vertically centred
hex   <- image_read("man/figures/logo.png")
hex   <- image_scale(hex, "x500")
hw    <- image_info(hex)$width
canvas <- image_composite(
  canvas, hex,
  offset = sprintf("+%d+%d", W - hw - 90L, (H - 500L) %/% 2L)
)

# Left-hand text block
mx <- 80L  # left margin
canvas <- image_annotate(canvas, "R PACKAGE", gravity = "northwest",
                         location = sprintf("+%d+%d", mx, 96L),
                         size = 30, weight = 700, kerning = 8,
                         color = gold, font = "Helvetica")
canvas <- image_annotate(canvas, "steves", gravity = "northwest",
                         location = sprintf("+%d+%d", mx - 4L, 130L),
                         size = 150, weight = 700,
                         color = "#FFFFFF", font = "Georgia")
# Gold rule under the wordmark
canvas <- image_composite(
  canvas, image_blank(360L, 6L, color = gold),
  offset = sprintf("+%d+%d", mx, 320L)
)
canvas <- image_annotate(
  canvas,
  "Every Rick Steves' Europe episode,\nas a tidy dataset for teaching.",
  gravity = "northwest", location = sprintf("+%d+%d", mx, 350L),
  size = 38, color = ltblue, font = "Helvetica"
)
canvas <- image_annotate(canvas, "159 episodes  ·  13 seasons  ·  2000–2025",
                         gravity = "northwest",
                         location = sprintf("+%d+%d", mx, 500L),
                         size = 30, color = sky, font = "Helvetica")

image_write(canvas, "man/figures/og-image.png", format = "png")
message("Wrote man/figures/og-image.png")
