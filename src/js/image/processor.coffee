

class ImageProcessor

  constructor: ( @image ) ->


  getImageData: ->
    canva = document.createElement( 'canvas' )
    canva.width = width = @image.width
    canva.height = height = @image.height

    document.body.appendChild( canva )
    context = canva.getContext( '2d' )
    context.drawImage( @image, 0, 0 )

    imageData = context.getImageData( 0, 0, width, height )
    document.body.removeChild( canva )

    return imageData

  getPixels: ->
    imgData = @getImageData()
    col = 0
    row = imgData.height
    data = imgData.data
    pixels = []

    for value, i in data by 4
      col++
      if i%( imgData.width*4 ) is 0
        col = 0; row--

      pixel = new ns.image.Pixel( col, row )
      pixel.setRBG( data[i], data[i+1], data[i+2] )
      pixels.push( pixel )

    return pixels

  removePixelsByRGB: ( pixels, r, g, b ) ->
    result = []
    for px in pixels
      if px.red isnt r and px.red isnt g and px.red isnt b
        result.push( px )

    return result

  randomSplit: ( pixels, number ) ->
    group2 = []
    while number > 0
      idx = Math.round( Math.random() * pixels.length )
      group2.push( pixels.splice( idx, 1)[0] )
      number--

    return [ pixels, group2 ]


window.ns ?= {}
window.ns.image ?= {}
window.ns.image.Processor = ImageProcessor
