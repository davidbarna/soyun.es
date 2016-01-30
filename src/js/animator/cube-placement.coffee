class CubePlacement

  constructor: ( @mesh, xRange = 0, yRange = 0, zRange = 0 ) ->
    x = Math.floor( Math.random() * xRange )
    y = Math.floor( Math.random() * yRange )
    z = Math.floor( Math.random() * zRange )

    @xTarget = @mesh.position.x
    @yTarget = @mesh.position.y
    @zTarget = @mesh.position.z
    @mesh.position.x = x
    @mesh.position.y = y
    @mesh.position.z = z

    @xVelocity = 0.01 + Math.random() * .02
    @yVelocity = 0.01 + Math.random() * .02
    @zVelocity = 0.01 + Math.random() * .02

  animate: =>
    @mesh.position.x += ( @xTarget - @mesh.position.x ) * @xVelocity
    @mesh.position.y += ( @yTarget - @mesh.position.y ) * @yVelocity
    @mesh.position.z += ( @zTarget - @mesh.position.z ) * @zVelocity *.8
    requestAnimationFrame( @animate )


window.ns ?= {}
window.ns.animation ?= {}
window.ns.animation.CubePlacement = CubePlacement
