class Pedido {
	const property distanciaARecorrer
	var property tiempoMaximo
	const property cantidadPasajeros
	const property coloresIncompatibles
	
	method velocidadRequerida() {
		return distanciaARecorrer / tiempoMaximo
	}
	
	method puedeSerSatisfecho(auto) {
		return self.satisfaceVelocidad(auto) 
			and self.satisfaceCapacidad(auto) 
			and self.satisfaceColor(auto) 
	}
	
	method satisfaceVelocidad(auto) = auto.velocidadMaxima() >= self.velocidadRequerida() + 10
	
	method satisfaceCapacidad(auto) {
		return auto.capacidad() >= cantidadPasajeros
	}
	
	method satisfaceColor(auto) {
//		return not coloresIncompatibles.any { c => c == auto.color() }
		return not self.esColorIncompatible(auto.color())
	}
	
	method esColorIncompatible(color) {
		return coloresIncompatibles.contains(color)
	}
	
	method acelerar() {
		tiempoMaximo -= 1
	}
	
	method relajar() {
		tiempoMaximo += 1
	}
}