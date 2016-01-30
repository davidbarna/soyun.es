class ImagePixel

  constructor: ( @x, @y ) ->

  setRBG: ( @red = 0, @green = 0, @blue = 0 ) ->
    return this



window.ns ?= {}
window.ns.image ?= {}
window.ns.image.Pixel = ImagePixel
