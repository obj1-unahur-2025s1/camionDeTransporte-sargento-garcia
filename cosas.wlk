object cosas {
    
}
object knightRider {
  method peso() = 500
  method nivelPeligrosidad() =  10
}
object bumblebee {
  var estaTransformadoEnAuto = true
  method peso() = 800
  method nivelPeligrosidad() {
    return if(estaTransformadoEnAuto ) 15
    else 30
  }  
  method transformar() = !estaTransformadoEnAuto
}
object paqueteDeLadrillos {
  const pesoUnitario = 2 
  var cantidad = 0

  method peso() = cantidad * pesoUnitario
  method nivelPeligrosidad() =  2
  method cantidad(unaCantidad) {cantidad = unaCantidad} 
}
object arenaAGranel {
  var peso = 1  
  method peso() = peso
  method cambiarPeso(unPeso) { peso = unPeso}
  method nivelPeligrosidad() =  1
}
object bateriaAntiAerea {
  var estaConLosMisiles = true

  method peso() {
    return if(estaConLosMisiles) 300
    else 200
  }
  method nivelPeligrosidad() {
    return (self.peso() - 200)
  }
}
object contenedorPortuario {
  const cosas = []
  method peso() = 100 + cosas.sum({c => c.peso()})
  method nivelPeligrosidad() {
    return if(cosas.isEmpty()) 0
    else cosas.max({c => c.nivelPeligrosidad()})
  }
  method agregarCosa(unaCosa) = cosas.add(unaCosa)
  method quitarCosa(unaCosa) = cosas.remove(unaCosa)   //agregar solo para testear
}
object residuosRadioactivos {
  var peso = 10
  method peso() = peso
  method cambiarPeso(unPeso) {peso = unPeso}
  method nivelPeligrosidad() =  200
}
object embalaje {
  var cosaEnvuelta = null  
  method peso() = cosaEnvuelta.peso()
  method nivelPeligrosidad() = cosaEnvuelta.nivelPeligrosidad() * 0.5
  method envolverCosa(unaCosa) {cosaEnvuelta = unaCosa}
}