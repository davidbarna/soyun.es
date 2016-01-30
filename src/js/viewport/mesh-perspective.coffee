class MeshPerspectiveViewport extends ns.viewport.Abstract

  constructor: ( @fov = 30, @distance = 400 ) ->
    super( @fov, @distance )
    @_width = .5
    @_height = .5
    @_bottom = 0
    @_left = .5

    @camera = new THREE.PerspectiveCamera( @fov, 1, 1, 10000 )

  lookAt: ( @targetX, @targetY, @targetZ ) ->
    @camera.position.x = @targetX - 60
    @camera.position.y = @targetY + 60
    @camera.position.z = 60

  setTargetMesh: ( mesh ) ->
    @mesh = mesh

  updateCamera: ->
    return unless !!@mesh
    xRatio = @mesh.position.x / @targetX
    yRatio = @mesh.position.y / @targetY
    @camera.lookAt( @mesh.position )


window.ns ?= {}
window.ns.viewport ?= {}
window.ns.viewport.MeshPerspective = MeshPerspectiveViewport
