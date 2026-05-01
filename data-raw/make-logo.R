library(magick)

img <- image_read(here::here("hex.png"))

logo <- img |>
  image_transparent(color = "white", fuzz = 8) |>
  image_trim() |>
  image_scale("480")

image_write(logo, here::here("man", "figures", "logo.png"), format = "png")
