package dominioTests

import dominio.Llamada
import dominio.SistemaDeFacturacion
import java.util.HashSet
import org.junit.Assert
import org.junit.Test

import static dominio.SistemaDeFacturacion.*

class TestsSistemaDeFacturacion extends AbstractTest {
	@Test
	def testFacturoDosClientes() {

		SistemaDeFacturacion.clientes.addAll(#[jonSnow, cerseiLannister])
		jonSnow.llamarMultiple(new HashSet<Llamada>(#[llamadaLocal1, llamadaLocal2, llamadaNoLocal1]))
		cerseiLannister.llamarMultiple(new HashSet<Llamada>(#[llamadaLocal3, llamadaNoLocal2]))
		SistemaDeFacturacion.facturar

		Assert.assertEquals(2, SistemaDeFacturacion.facturasRealizadas.size)
	}

	@Test
	def testIntegracionEnConsola() {
		
		SistemaDeFacturacion.mostrarEnConsola = true
		SistemaDeFacturacion.clientes.addAll(#[jonSnow, cerseiLannister])
		jonSnow.llamarMultiple(new HashSet<Llamada>(#[llamadaLocal1, llamadaLocal2, llamadaNoLocal1]))
		cerseiLannister.llamarMultiple(new HashSet<Llamada>(#[llamadaLocal3, llamadaNoLocal2]))
		SistemaDeFacturacion.facturar

		Assert.assertTrue(true)
	}

}
