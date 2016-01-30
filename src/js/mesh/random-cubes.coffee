class RandomCubesMesh extends ns.mesh.PixelCubes

  constructor: ->
    super()

  addRandomPixels: ( materials, number, xRange = 0, yRange = 0, zRange = 0 ) ->
    while number > 0
      materialIdx = Math.floor( materials.length * Math.random() )
      material = materials[materialIdx]

      x = Math.floor( Math.random() * xRange )
      y = Math.floor( Math.random() * yRange )
      z = Math.floor( Math.random() * zRange )
      color = material.color

      @addPixel( color.r*255, color.g*255, color.b*255, x, y, z )
      number--

    @centerGeometry()




window.ns ?= {}
window.ns.mesh ?= {}
window.ns.mesh.RandomCubes = RandomCubesMesh
