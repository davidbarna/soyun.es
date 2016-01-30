story = null

window.onload = ->
  story = new ns.ImageUnderConstruction( 'img/background.png' )
  story.appendTo( document.getElementById( 'main-viewport' ) )


window.onresize = ->
  story.resize()
