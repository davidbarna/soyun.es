class MeshObserverViewport extends ns.viewport.Abstract

  constructor: ( @fov = 30, @distance = 400 ) ->
    super( @fov, @distance )
    @_width = 1
    @_height = .5
    @_bottom = .5
    @_left = 0

    @camera = new THREE.PerspectiveCamera( @fov, 1, 1, 10000 )
    @mouse = new ns.mouse.Position()

  setTargetMesh: ( mesh ) ->
    @target = mesh.position

  updateCamera: ->
    targetX = @mouse.x - @width/2
    targetY = @mouse.y - @height*2
    @camera.position.x += ( targetX - @camera.position.x ) * 0.03
    @camera.position.y += ( - targetY - @camera.position.y ) * 0.03
    @camera.position.z = @target.z + @distance

    @camera.lookAt( x: @target.x, y: @target.y, z: @target.z ) if !!@target


window.ns ?= {}
window.ns.viewport ?= {}
window.ns.viewport.MeshObserver = MeshObserverViewport