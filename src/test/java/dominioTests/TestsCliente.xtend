package dominioTests

import dominio.Llamada
import java.util.HashSet
import org.junit.Assert
import org.junit.Test
import dominio.SistemaDeFacturacion

class TestsCliente extends AbstractTest {

	@Test
	def void testHaceUnaLlamada() {
		jonSnow.llamar(llamadaLocal1)
		Assert.assertEquals(1, jonSnow.llamadasSinFacturar.size)
	}

	@Test
	def void testHaceVariasLlamadas() {
		jonSnow.llamarMultiple(new HashSet<Llamada>(#[llamadaLocal1, llamadaLocal2, llamadaNoLocal1]))
		Assert.assertEquals(3, jonSnow.llamadasSinFacturar.size)
	}

	@Test
	def void testFacturacionVaciaLasLlamadas() {
		SistemaDeFacturacion.clientes.add(jonSnow)
		jonSnow.llamar(llamadaNoLocal1)
		SistemaDeFacturacion.facturar
		Assert.assertEquals(0, jonSnow.llamadasSinFacturar.size)
	}
}
