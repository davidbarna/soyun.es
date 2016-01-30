class CubeObserverViewport extends ns.viewport.Abstract

  constructor: ( @fov = 60, @distance = 400 ) ->
    super( @fov, @distance )
    @_width = .5
    @_height = .5
    @_bottom = 0
    @_left = 0

    @camera = new THREE.PerspectiveCamera( @fov, 1, 1, 10000 )

  lookAt: ( @targetX, @targetY, @targetZ ) ->

  setTargetMesh: ( mesh ) ->
    @mesh = mesh

  updateCamera: ->
    return unless !!@mesh
    xRatio = @mesh.position.x / @targetX
    yRatio = @mesh.position.y / @targetY

    @camera.position.x = @mesh.position.x * xRatio
    @camera.position.y = @mesh.position.y * yRatio
    @camera.position.z = @mesh.position.z + 20
    @camera.lookAt( x: @targetX, y: @targetY, z: @targetZ )

window.ns ?= {}
window.ns.viewport ?= {}
window.ns.viewport.CubeObserver = CubeObserverViewport
