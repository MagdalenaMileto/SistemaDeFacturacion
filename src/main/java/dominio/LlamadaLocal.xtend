package dominio

import org.eclipse.xtend.lib.annotations.Accessors

class LlamadaLocal implements Llamada {

	@Accessors
	FranjaHoraria franjaHoraria
	@Accessors
	double duracion

	new(FranjaHoraria franjaHoraria, double duracion) {
		this.franjaHoraria = franjaHoraria
		this.duracion = duracion
	}

	override costoDeLaLlamada() {
		return franjaHoraria.precioPorMinuto() * duracion
	}

	override detalleDeLaLlamada() {
		System.out.println("	* Llamada local")
		System.out.println("		* Precio por minuto: $" + this.franjaHoraria.precioPorMinuto)
		System.out.println("		* Duracion " + duracion.toString() + " minutos")
		System.out.println(
			"		* Monto A Pagar: $" + this.costoDeLaLlamada().toString()
		)

	}

}
