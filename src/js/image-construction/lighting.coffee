class ImageUnderConstructionLighting

  constructor: ( @scene ) ->
    @light1 = new THREE.SpotLight( 0xffffff, 2.5, 250 )
    @light1.position.set 8000, 100, 100

    @light2 = new THREE.SpotLight( 0xffffff, 1.5, 1000 )
    @light2.position.set -400, 200, 300


    @scene.add( @light1 )
    @scene.add( @light2 )


  addHelpers: ->
    light1Helper = new THREE.PointLightHelper( @light1, 5 )
    light2Helper = new THREE.PointLightHelper( @light2, 5 )
    @scene.add( light1Helper )
    @scene.add( light2Helper )
    # @light1.shadowCameraVisible = true
    # @light2.shadowCameraVisible = true


window.ns ?= {}
window.ns.ImageUnderConstructionLighting = ImageUnderConstructionLighting
