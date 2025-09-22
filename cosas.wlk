object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultosUsados() {return 1}
	method sufrirAccidente() { }
}

object arenaAGranel {
	var property peso = 0 
	method nivelPeligrosidad() { return 1}
	method bultosUsados() {return 1}
	method sufrirAccidente() {peso = peso + 20}
}

object bumblebee {
	method peso() { return 800 }
	var property esAuto = false 
	method nivelPeligrosidad() { 
		if (esAuto)
			{return 15}
		else 
			{return 30}
	}
	method bultosUsados() {return 2}
	method sufrirAccidente() { 
		if (esAuto)
			{esAuto=false}
		else {esAuto=true}
	 }
}

object paqueteDeLadrillos {
	var property cantidad = 0
	method peso() {return cantidad * 2 }
	method nivelPeligrosidad() { return 2 }
	method bultosUsados() {
		if (cantidad < 101) 
			{return 1} 
		else if (cantidad >= 101 && cantidad <= 300) 
			{return 2}
		else 
			{return 3}
	}
	method sufrirAccidente() {
		if (cantidad > 12)
			{ cantidad = cantidad - 12}
		else 
			{cantidad = 0}
	 }
}

object bateriaAntiaerea {
	var property estaConMisiles = null
	method peso() { 
		if (estaConMisiles)
			{return 300}
		else 
			{return 200}
		}

	method nivelPeligrosidad() { 
		if (estaConMisiles)
		 	{return 100}
		else 
			{return 0}
	 }

	method bultosUsados() {
		if (estaConMisiles)
			{return 2}
		else 
			{return 1}
	}
	method sufrirAccidente() {
		estaConMisiles = false
	 }
}

object residuosRadioactivos {
	var property peso = 0 
	method nivelPeligrosidad() {return 200}
	method bultosUsados() {return 1}
	method sufrirAccidente() {peso= peso + 15}
}

object contenedorPortuario {
	const property pesoBase = 100
	const property cosasAdentro = []

	method peso() { 
		return pesoBase + cosasAdentro.map({unaCosa => unaCosa.peso()}).sum()
	} 

	method nivelPeligrosidad() {
		if (cosasAdentro.isEmpty()) 
			{return 0}
		else 
			{return cosasAdentro.map({unaCosa => unaCosa.nivelPeligrosidad()}).max()} 
	}

	method agregarCosa(unaCosa) {
    	cosasAdentro.add(unaCosa)
	}

	method sacarCosa(unaCosa) {
  		cosasAdentro.remove(unaCosa)
	}

	method bultosUsados() {
		return 1 + cosasAdentro.map({unaCosa => unaCosa.bultosUsados()}).sum()
	  
	}

	method sufrirAccidente() { 
		cosasAdentro.forEach {unaCosa => unaCosa.sufrirAccidente()}
	}
}

object embalajeDeSeguridad {
	var property cosaAdentro = null

	method nivelPeligrosidad() {
		return cosaAdentro.nivelPeligrosidad() / 2
	} 

	method peso() {
        return cosaAdentro.peso()
    }
	method bultosUsados() {return 2}
	
	method sufrirAccidente() { }
}
