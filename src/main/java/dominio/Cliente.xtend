package dominio

import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors

class Cliente {

	@Accessors
	String nombreYApellido
	@Accessors
	TipoDeAbono planMensual
	@Accessors
	HashSet<Llamada> llamadasSinFacturar

	new(String nombreYApellido, TipoDeAbono plan) {
		this.nombreYApellido = nombreYApellido
		this.planMensual = plan
		this.llamadasSinFacturar = new HashSet<Llamada>
	}

	def llamadasPorFacturar() {
		val llamadas = new HashSet<Llamada>
		llamadas.addAll(llamadasSinFacturar)
		this.llamadasSinFacturar.clear()
		return llamadas
	}

	def montoDelAbono() {
		return this.planMensual.abonoMensual
	}

	def llamar(Llamada llamada) {
		this.llamadasSinFacturar.add(llamada)
	}

	def llamarMultiple(HashSet<Llamada> llamadas) {
		this.llamadasSinFacturar.addAll(llamadas)
	}

}
