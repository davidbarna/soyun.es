class MainLight

  constructor:  ->
    @light = new THREE.HemisphereLight( 0xffffff, 0xffffff, .6 )
    @light.color.setHSL( 0.6, .5, 0.9 )
    # @light.groundColor.setHSL( 0.1, 0.8, 0.7 )
    @light.position.y = 500

    return this

window.ns ?= {}
window.ns.light ?= {}
window.ns.light.Main = MainLight
