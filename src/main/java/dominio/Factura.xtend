package dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashSet
import java.time.LocalDate

class Factura {
	@Accessors
	int numeroDeFactura
	@Accessors
	static int numeroDeFacturaAnterior = 0
	@Accessors
	String fecha
	@Accessors
	Cliente cliente
	@Accessors
	HashSet<Llamada> llamadasFacturadas
	@Accessors
	double precioTotalFacturado

	new(Cliente cliente, boolean mostrarEnConsola) {
		this.numeroDeFactura = asignarNumeroDeFactura()
		this.fecha = LocalDate.now().toString
		this.cliente = cliente
		this.llamadasFacturadas = cliente.llamadasPorFacturar()
		this.precioTotalFacturado = llamadasFacturadas.map[llamada|llamada.costoDeLaLlamada].reduce[sum, size|sum + size] +
			cliente.montoDelAbono
		if (mostrarEnConsola)
			this.visualizar()

	}

	def static int asignarNumeroDeFactura() {
		numeroDeFacturaAnterior = numeroDeFacturaAnterior + 1
		return numeroDeFacturaAnterior
	}

	def static int ultimoNumeroFactura() {
		return numeroDeFacturaAnterior
	}

	def visualizar() {

		System.out.println("• • • • • • • • • • • • FACTURA • • • • • • • • • • • •")
		System.out.println("Número de Factura: " + this.numeroDeFactura.toString())
		System.out.println("Cliente: " + this.cliente.nombreYApellido)
		System.out.println("• • • • • • • • • • • •")
		System.out.println("Detalles del Servicio")
		System.out.println("• • • • • • • • • • • • ")
		System.out.println("Cargos fijos")
		System.out.println("	*Abono mensual: $" + this.cliente.montoDelAbono.toString())
		System.out.println("Cargos variables")
		llamadasFacturadas.forEach[llamada|llamada.detalleDeLaLlamada()]
		System.out.println("Total: $" + this.precioTotalFacturado.toString())
		System.out.println
		System.out.println
	}

	def static void resetearNumeroFactura() {
		numeroDeFacturaAnterior = 0
	}

}
