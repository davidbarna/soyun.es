class GroundMesh

  constructor: ( @size = 10000 ) ->
    @material = new THREE.MeshPhongMaterial {
      color: 0xdddddd
      ambient: 0xaaaaaa
      shininess: 300
      specular: 0x333333
    }
    @geometry = new THREE.PlaneBufferGeometry( @size, @size )
    @mesh = new THREE.Mesh( @geometry, @material )
    @mesh.rotation.x = -0.5 * Math.PI
    @mesh.position.y = -10
    @mesh.receiveShadow = true

window.ns ?= {}
window.ns.mesh ?= {}
window.ns.mesh.Ground = GroundMesh
