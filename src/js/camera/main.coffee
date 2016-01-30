class CameraMain

  constructor: ( @width, @height ) ->
    @camera = new THREE.PerspectiveCamera( 30, @width / @height, 0.5, 1000 )
    @camera.position.z = 400
    @mouse = new ns.mouse.Position()

  render: ->
    targetX = @mouse.x - @width/2
    targetY = @mouse.y - @height/2
    @camera.position.x += ( targetX - @camera.position.x ) * 0.03
    @camera.position.y += ( - targetY - @camera.position.y ) * 0.03
    @camera.lookAt x: 0, y: 100, z: 0

window.ns ?= {}
window.ns.camera ?= {}
window.ns.camera.Main = CameraMain
