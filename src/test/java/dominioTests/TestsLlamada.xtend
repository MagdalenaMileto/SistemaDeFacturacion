package dominioTests

import org.junit.Assert
import org.junit.Test

class TestsLlamada extends AbstractTest {

	@Test
	def testCostoLlamadaLocal() {
		Assert.assertEquals(12.0, llamadaLocal1.costoDeLaLlamada, 0)
	}

	@Test
	def testCostoLlamadaNoLocal() {
		Assert.assertEquals(3000.0, llamadaNoLocal1.costoDeLaLlamada, 0)
	}
}
