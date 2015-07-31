package dominio

import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors

class SistemaDeFacturacion {

	@Accessors
	static HashSet<Factura> facturasRealizadas = new HashSet<Factura>
	@Accessors
	static HashSet<Cliente> clientes = new HashSet<Cliente>
	@Accessors
	static boolean mostrarEnConsola

	def static facturar() {
		clientes.forEach[cliente|facturasRealizadas.add(new Factura(cliente, mostrarEnConsola))]
	}
}
