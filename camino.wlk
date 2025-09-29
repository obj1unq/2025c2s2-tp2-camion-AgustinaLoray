import camion.*
import cosas.*

object ruta9 {
    method soportaViajesDe(vehiculo) {
        return vehiculo.puedoCircularEnRuta(20)
    }
}

object caminosVecinales {
    var property pesoMax = 0
    method soportaViajesDe(vehiculo) {
        return vehiculo.pesoTotal() <= pesoMax
      
    }
}
