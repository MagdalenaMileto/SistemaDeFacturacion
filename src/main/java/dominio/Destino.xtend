package dominio

import org.eclipse.xtend.lib.annotations.Accessors

class Destino {

	@Accessors
	double precio
	@Accessors
	String destino
	
	new(String destino, double precio){
		this.destino = destino
		this.precio = precio
	}

	def precioPorMinuto() {
		return precio
	}

}
