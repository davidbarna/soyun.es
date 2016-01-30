class ImageCubesMesh extends ns.mesh.PixelCubes

  constructor: ->
    super()

  addPixels: ( pixels ) ->
    for pixel in pixels
      @addPixel( pixel.red, pixel.green, pixel.blue, pixel.x, pixel.y, pixel.z )
    @centerGeometry()
    return this


window.ns ?= {}
window.ns.mesh ?= {}
window.ns.mesh.ImageCubes = ImageCubesMesh
