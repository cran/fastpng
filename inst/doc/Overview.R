## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(fastpng)

## ----fig.height = 2-----------------------------------------------------------
library(fastpng)
png_file <- system.file("img", "Rlogo.png", package="png")
fastpng::get_png_info(png_file)

ras <- fastpng::read_png(png_file, type = 'raster') 
grid::grid.raster(ras, interpolate = FALSE)

## -----------------------------------------------------------------------------
ras <- fastpng::read_png(png_file, type = "raster")
ras[7:11, 79:83]

## -----------------------------------------------------------------------------
ras <- fastpng::read_png(png_file, type = "array")
ras[7:11, 79:83, 1] # red channel

## -----------------------------------------------------------------------------
ras <- fastpng::read_png(png_file, type = "array", array_type = 'integer')
ras[7:11, 79:83, 1] # red channel

## -----------------------------------------------------------------------------
im <- fastpng::read_png(png_file, type = "nativeraster")
im[7:11, 79:83]

## -----------------------------------------------------------------------------
png_file <- tempfile()
fastpng::write_png(im, png_file)  # standard compression
file.size(png_file)

## -----------------------------------------------------------------------------
fastpng::write_png(im, png_file, compression_level = 0) # no compression, but fast!
file.size(png_file)

## -----------------------------------------------------------------------------
indices <- test_image$indexed$integer_index
palette <- test_image$indexed$palette

dim(indices)
indices[1:10, 1:10]
palette[1:10]

## ----eval=FALSE---------------------------------------------------------------
# tmp <- tempfile()
# fastpng::write_png(image = indices, palette = palette, file = tmp)

## ----echo=FALSE, fig.height = 3-----------------------------------------------
fastpng::write_png(image = indices, palette = palette) |>
  fastpng::read_png() |> 
  grid::grid.raster()

