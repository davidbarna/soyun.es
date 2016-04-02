class CubePlacement

  constructor: ( @mesh, xRange = 0, yRange = 0, zRange = 0 ) ->
    x = -xRange/2 + Math.floor( Math.random() * xRange )
    y = -yRange/2 + Math.floor( Math.random() * yRange )
    z = zRange/2 + Math.floor( Math.random() * zRange )

    @xTarget = @mesh.position.x
    @yTarget = @mesh.position.y
    @zTarget = @mesh.position.z
    @mesh.position.x = x
    @mesh.position.y = y
    @mesh.position.z = z

    @xVelocity = 0.01 + Math.random() * .04
    @yVelocity = 0.01 + Math.random() * .04
    @zVelocity = 0.01 + Math.random() * .04

  animate: =>
    @mesh.position.x += ( @xTarget - @mesh.position.x ) * @xVelocity
    @mesh.position.y += ( @yTarget - @mesh.position.y ) * @yVelocity
    @mesh.position.z += ( @zTarget - @mesh.position.z ) * @zVelocity *.3
    requestAnimationFrame( @animate )


window.ns ?= {}
window.ns.animation ?= {}
window.ns.animation.CubePlacement = CubePlacement
