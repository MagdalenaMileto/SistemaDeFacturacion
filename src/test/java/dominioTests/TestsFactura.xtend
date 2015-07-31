package dominioTests

import dominio.SistemaDeFacturacion
import org.junit.Test
import org.junit.Assert
import dominio.Factura

class TestsFactura extends AbstractTest {

	@Test
	def testAumentaElNumeroDeFacturas() {
		SistemaDeFacturacion.clientes.add(jonSnow)
		jonSnow.llamar(llamadaLocal1)
		SistemaDeFacturacion.facturar
		jonSnow.llamar(llamadaLocal2)
		SistemaDeFacturacion.facturar
		Assert.assertEquals(2, Factura.ultimoNumeroFactura)
	}

	@Test
	def testPrecioFinal() {
		SistemaDeFacturacion.clientes.add(jonSnow)
		jonSnow.llamar(llamadaLocal1)
		SistemaDeFacturacion.facturar
		Assert.assertEquals(312.0, SistemaDeFacturacion.facturasRealizadas.head.precioTotalFacturado, 0)
	}

}
