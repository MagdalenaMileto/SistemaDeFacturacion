package dominio

import org.eclipse.xtend.lib.annotations.Accessors

class FranjaHoraria {

	@Accessors
	double precio
	
	new(double precio) {
		this.precio = precio
	}

	def precioPorMinuto() {
		return precio
	}
}
