class ImageUnderConstruction

  constructor: ( @imgUrl ) ->
    @viewports = []
    @scene = new ns.scene.ImageConstruction( @imgUrl )
    @renderer = new THREE.WebGLRenderer( antialias: true )
    @renderer.setClearColor( @scene.fog.color, 1, 1 )
    @renderer.shadowMapEnabled = true

    @viewports.push( new ns.viewport.MeshObserver() )
    @viewports.push( new ns.viewport.MeshPerspective() )
    @viewports.push( new ns.viewport.CubeObserver() )

    @lighting = new ns.ImageUnderConstructionLighting( @scene.scene )
    @lighting.addHelpers()

    @scene.onLoad( =>
      @viewports[0].setTargetMesh( @scene.getMainMesh() )

      cubeAnimation = =>
        anim = @scene.getCubeAnimator()
        @viewports[1].lookAt( anim.xTarget, anim.yTarget, anim.zTarget )
        @viewports[1].setTargetMesh( anim.mesh )
        @viewports[2].lookAt( anim.xTarget, anim.yTarget, anim.zTarget )
        @viewports[2].setTargetMesh( anim.mesh )

      setInterval cubeAnimation, 5000
      cubeAnimation()

      @render()
    )

  appendTo: ( @element ) ->
    @element.appendChild( @renderer.domElement )
    @resize()
    return this

  resize: ->
    @setSize( @element.offsetWidth, @element.offsetHeight )

  setSize: ( @width, @height ) ->
    @renderer.setSize( @width, @height )
    for viewport in @viewports
      v = viewport
      v.setSize( @width, @height )
    return this

  render: =>
    for v in @viewports
      v.updateCamera()
      @renderer.setViewport( v.left, v.bottom, v.width, v.height )
      @renderer.setScissor( v.left, v.bottom, v.width, v.height )
      @renderer.enableScissorTest( true )
      @renderer.render( @scene.scene, v.camera )

    requestAnimationFrame( @render )


window.ns ?= {}
window.ns.ImageUnderConstruction = ImageUnderConstruction
