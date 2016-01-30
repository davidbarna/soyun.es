class ImageSource

  constructor: ->

  getFromUrl: ( url ) ->
    image = new Image()
    image.src = url

    return new Promise( ( resolve, reject ) ->
      image.onload = -> resolve( this )
      image.onerror = ( evt ) -> reject()
    )

window.ns ?= {}
window.ns.image ?= {}
window.ns.image.source = new ImageSource()
