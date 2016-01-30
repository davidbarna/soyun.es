class PixelCubeMesh
  constructor: ( @pixel ) ->
    @spacing = 4
    @geometry = @getGeometry()
    @material = @getMaterial( @pixel.red, @pixel.green, @pixel.blue )
    @mesh = new THREE.Mesh( @geometry, @material )
    @mesh.position.x = @pixel.x * @spacing
    @mesh.position.y = @pixel.y * @spacing

  getGeometry: ( xSize = 3, ySize = xSize, zSize = xSize ) ->
    new THREE.BoxGeometry( xSize, ySize, zSize )

  getMaterialId: ( R, G, B ) ->
    color = new THREE.Color( R/255, G/255, B/255 )
    return color.getHexString()

  getMaterial: ( R, G, B ) ->
    color = new THREE.Color( R/255, G/255, B/255 )
    return new THREE.MeshLambertMaterial( color: color )


window.ns ?= {}
window.ns.mesh ?= {}
window.ns.mesh.PixelCube = PixelCubeMesh
