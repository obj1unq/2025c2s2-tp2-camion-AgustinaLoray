import camion.*
import cosas.*

object almacen {
    const property cosas = #{}

    method recibirCarga(cosasVehiculo) {
        cosas.addAll(cosasVehiculo)
    } 

    method almacenar(unaCosa) {
        cosas.add(unaCosa)
    }
  
}