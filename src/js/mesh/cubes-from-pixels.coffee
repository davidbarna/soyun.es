class PixelCubesMesh

  constructor: ( @xSize, @ySize, @zSize ) ->
    @colors = {}
    @materials = []
    @geometry = new THREE.Geometry()
    @material = new THREE.MeshFaceMaterial( @materials )
    @mesh = new THREE.Mesh( @geometry, @material )
    @pixelGeometry = ns.mesh.PixelCube::getGeometry( @xSize, @ySize, @zSize )
    @spacing = 4
    @width = @height = @depth = 0

  addPixel: ( r = 0, g = 0, b = 0, x = 0, y = 0, z = 0 ) ->
    materialIndex = @addColorMaterial( r, g, b )
    geometry = @pixelGeometry.clone()
    matrix = new THREE.Matrix4()
    matrix.makeTranslation( x*@spacing, y*@spacing, z*@spacing )
    geometry.applyMatrix( matrix )

    for face, i in geometry.faces
      face.materialIndex = materialIndex

    @setSize( x, y, z )
    @geometry.merge( geometry )

  addColorMaterial : (R, G, B)->
    color = new THREE.Color( R/255, G/255, B/255 )
    hex = ns.mesh.PixelCube::getMaterialId( R, G, B )
    return @colors[ hex ] if !!@colors[hex]

    idx = @materials.length
    @colors[ hex ] = idx
    @materials[ idx ] ?= ns.mesh.PixelCube::getMaterial( R, G, B )

    return idx

  setSize: ( x, y, z ) ->
    _size = (x*@spacing) + @pixelGeometry.widthSegments
    @width = _size if _size > @width

    _size = (y*@spacing) + @pixelGeometry.heightSegments
    @height = _size if _size > @height

    _size = (z*@spacing) + @pixelGeometry.depthSegments
    @depth = _size if _size > @depth

  centerGeometry: ->
    matrix = new THREE.Matrix4()
    matrix.makeTranslation( -(@width/2), -@height/2, -@depth/2 )
    @geometry.applyMatrix( matrix )

  getMesh: ->
    return @mesh

window.ns ?= {}
window.ns.mesh ?= {}
window.ns.mesh.PixelCubes = PixelCubesMesh
