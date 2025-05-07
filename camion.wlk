object camion {
    const tara = 1000
    const cosas = []

    method cargar(unaCosa) {
      cosas.add(unaCosa)
    }
    method descargar(unaCosa) {
      cosas.remove(unaCosa)
    }
    method pesoTotal() = tara + cosas.sum({c => c.peso()})
    method pesoCargadoEsPar() = cosas.sum({c => c.peso()}).even()
    method pesoEsIgualA(unValor) = cosas.any({c => c.peso()==unValor}) 
    method controlPrimerCosaCargada(nivelPeligrosidad) {
        return cosas.find({c => c.nivelPeligrosidad()==nivelPeligrosidad})
    }
    method cosasQueSuperanNivelPeligrosidad(nivelPeligrosidad) {
        return cosas.filter({c => c.nivelPeligrosidad() == nivelPeligrosidad})
    }
    method cosaMasPeligrosaQue(unaCosa) {
        return cosas.filter({c => c.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()})
    }
    method estaExcedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
        return
            !self.estaExcedidoDePeso() && 
            !cosas.any({c => c.nivelPeligrosidad() > nivelMaximoPeligrosidad})
    } 

}