class AbstractViewport

  constructor: ( fov = 30, distance = 400 ) ->
    @mouse = new ns.mouse.Position()

  setSize: ( width, height ) ->
    @left = width * @_left
    @bottom = height * @_bottom
    @width = width * @_width
    @height = height * @_height
    @camera.aspect = @width / @height
    @camera.updateProjectionMatrix()
    return this

  updateCamera: ->

window.ns ?= {}
window.ns.viewport ?= {}
window.ns.viewport.Abstract = AbstractViewport
