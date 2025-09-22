import cosas.*
import camino.*

object camion {
	const property cosas = #{}
	const property tara = 1000 
		
	method cargar(unaCosa) {
	self.validarPoderCargar(unaCosa)
	cosas.add(unaCosa)
	}

	method validarPoderCargar(unaCosa) {
		if (cosas.contains(unaCosa))
		{self.error("No puedo cargar algo ya cargado")}
	}

	method descargar(unaCosa) {
	self.validarPoderDescargar(unaCosa)
	cosas.remove(unaCosa)
	}

	method validarPoderDescargar(unaCosa) {
		if (not cosas.contains(unaCosa))
		{self.error("No puedo descargar algo que no contiene el camion")}
	}

	method todoElPesoEsPar() {
		return cosas.all{unaCosa => unaCosa.peso() % 2 == 0}
	}

	method hayAlgoQuePesa(cantidad) {
		return cosas.any{unaCosa => unaCosa.peso() == cantidad}
	}

	method pesoTotal() {
		return tara + cosas.map({unaCosa => unaCosa.peso()}).sum()
	}

	method enExcesoDePeso() {
		return self.pesoTotal() > 2500
	}

	method hayDeNivel(unNivel) {
		return cosas.find{unaCosa => unaCosa.nivelPeligrosidad() == unNivel}
	}

	method algoQueSupereNivel(unNivel) {
		return cosas.find{unaCosa => unaCosa.nivelPeligrosidad() > unNivel}
	}

	method cosaMasPeligrosaQue(unaCosa) {
		return self.algoQueSupereNivel(unaCosa.nivelPeligrosidad())
	}

	method cosasQueSuperanNivel(unNivel) {
    	return cosas.filter{ unaCosa => unaCosa.nivelPeligrosidad() > unNivel }
	}

	method puedoCircularEnRuta(unNivel) {
		return (not self.enExcesoDePeso() && (self.cosasQueSuperanNivel(unNivel).isEmpty()))
	  
	}

	method tienAlgoQuePesaEntre(valorMin, valorMax) {
		return cosas.any{unaCosa => unaCosa.nivelPeligrosidad() > valorMin 
				&& unaCosa.nivelPeligrosidad() < valorMax }
	}

	method cosaMasPesada() {
		self.validarCamionLleno()
		return cosas.max({unaCosa => unaCosa.peso()})
	}

	method validarCamionLleno() {
		if (camion.cosas().isEmpty())
			{self.error("No hay cosas en el camion")}
	}

	method pesoDeLasCosas() {
		return cosas.map{unaCosa => unaCosa.peso()}
	}

	method cantidadTotalDeBultos() {
		return cosas.map({unaCosa => unaCosa.bultosUsados()}).sum()
	}

	method accidente() {
		cosas.forEach{unaCosa => unaCosa.sufrirAccidente()}
	  
	}

	method transportar(destino, camino) {
		if (camino.soportaViajesDe(self))
			{self.llegarADestino(destino)}
		else {self.error("No puedo viajar por este camino")}
	}

	method llegarADestino(destino) {
		destino.recibirCarga(cosas)
		cosas.clear()
	}


}
