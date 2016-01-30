MOUSE_EVENT = 'mousemove'

instance = null

class MousePosition

  _mouseMoveHandler: ( evt ) =>
    @x = evt.clientX
    @y = evt.clientY

  constructor: ->
    return instance if !!instance
    instance = this
    @x = @y = 0
    document.addEventListener( MOUSE_EVENT, @_mouseMoveHandler, false )

    return instance



window.ns ?= {}
window.ns.mouse ?= {}
window.ns.mouse.Position = MousePosition
