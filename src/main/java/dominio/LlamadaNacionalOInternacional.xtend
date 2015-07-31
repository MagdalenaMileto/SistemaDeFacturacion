package dominio

import org.eclipse.xtend.lib.annotations.Accessors

class LlamadaNacionalOInternacional implements Llamada {

	@Accessors
	Destino destinoDeLlamada
	@Accessors
	double duracion

	new(Destino destino, double duracion) {
		this.destinoDeLlamada = destino
		this.duracion = duracion
	}

	override costoDeLaLlamada() {
		return destinoDeLlamada.precioPorMinuto() * duracion
	}

	override detalleDeLaLlamada() {
		System.out.println("	* Llamada a " + this.destinoDeLlamada.destino)
		System.out.println("		* Duracion: " + this.duracion + " minutos")
		System.out.println("		* Precio por minuto: $" + this.destinoDeLlamada.precioPorMinuto)
		System.out.println(
			"		* Monto A Pagar: $" + this.costoDeLaLlamada().toString()
		)

	}

}
