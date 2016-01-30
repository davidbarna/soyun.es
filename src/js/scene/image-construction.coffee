class ImageConstruction

  constructor: ( @imgUrl ) ->
    @_onLoadCallbacks = []
    @fog = new THREE.Fog( 0xffffff, 400, 1500 )
    @scene = new THREE.Scene()
    @scene.fog = @fog

    # Add meshes to the scene
    @scene.add( ns.light.Main().light )
    @scene.add( new ns.mesh.Ground().mesh )

    ns.image.source.getFromUrl( @imgUrl )
      .then ( image ) =>
        @setPixelsGroups( image )
        @addPixelsMesh( @selectedPixels )
        @addRandomCubesMesh( @pixelsMesh.materials )
        @addDisplacedPixelsMesh( @discardedPixels )
        cb() for cb in @_onLoadCallbacks

    return this

  setPixelsGroups: ( image ) ->
    processor = new ns.image.Processor( image )
    pixels = processor.getPixels()
    pixels = processor.removePixelsByRGB( pixels, 255, 255, 255 )
    pixelsGroups = processor.randomSplit( pixels,  pixels.length * 0.4 )
    @selectedPixels = pixelsGroups[0]
    @discardedPixels = pixelsGroups[1]

  addPixelsMesh: ( pixels ) ->
    @pixelsMesh = new ns.mesh.ImageCubes( )
    @pixelsMesh.addPixels( pixels )
    @pixelsMesh.mesh.position.y = @pixelsMesh.height/2
    @scene.add( @pixelsMesh.getMesh() )

  addRandomCubesMesh: ( materials ) ->
    @randomMesh = new ns.mesh.RandomCubes()
    @randomMesh.addRandomPixels( materials, 5000, 300, 300, 300 )
    @randomMesh.mesh.position.y = 1.5
    @pixelsMesh.mesh.castShadow = true
    @scene.add( @randomMesh.getMesh() )

  addDisplacedPixelsMesh: ( pixels ) ->
    @animators = []
    for pixel in pixels
      mesh = new ns.mesh.PixelCube( pixel )
      mesh.mesh.position.x -= @pixelsMesh.width/2
      animator = new ns.animation.CubePlacement( mesh.mesh, 400, 400, 400 )
      @animators.push( animator )

  getMainMesh: ->
    return @pixelsMesh.mesh

  getCubeAnimator: ->
    idx = Math.floor( Math.random() * @animators.length )
    animator = @animators[idx]
    @animators.splice( idx, 1 )
    @scene.add( animator.mesh )
    animator.animate()
    return animator


  addHelpers: ->
    @scene.add( new THREE.AxisHelper 500 )

  onLoad: ( callback ) ->
    @_onLoadCallbacks.push( callback )

window.ns ?= {}
window.ns.scene ?= {}
window.ns.scene.ImageConstruction = ImageConstruction
