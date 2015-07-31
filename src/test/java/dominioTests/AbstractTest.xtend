package dominioTests

import dominio.Cliente
import dominio.Destino
import dominio.FranjaHoraria
import dominio.LlamadaLocal
import dominio.LlamadaNacionalOInternacional
import dominio.TipoDeAbono
import org.junit.Before
import dominio.SistemaDeFacturacion
import dominio.Factura

class AbstractTest {

	public FranjaHoraria diasHabilesDe8a20
	public FranjaHoraria diasHabilesDe20a8
	public FranjaHoraria finesDeSemana

	public LlamadaLocal llamadaLocal1
	public LlamadaLocal llamadaLocal2
	public LlamadaLocal llamadaLocal3
	public LlamadaNacionalOInternacional llamadaNoLocal1
	public LlamadaNacionalOInternacional llamadaNoLocal2

	public Destino paris
	public Destino mendozaCapital
	public TipoDeAbono black
	public TipoDeAbono gold

	public Cliente jonSnow
	public Cliente cerseiLannister

	@Before
	def void setUp() {

		black = new TipoDeAbono(300)
		gold = new TipoDeAbono(100)

		diasHabilesDe8a20 = new FranjaHoraria(0.20)
		diasHabilesDe20a8 = new FranjaHoraria(0.10)
		finesDeSemana = new FranjaHoraria(0.10)

		paris = new Destino("Paris", 100)
		mendozaCapital = new Destino("Mendoza", 10.5)

		llamadaLocal1 = new LlamadaLocal(diasHabilesDe8a20, 60)
		llamadaLocal2 = new LlamadaLocal(diasHabilesDe20a8, 50)
		llamadaLocal3 = new LlamadaLocal(finesDeSemana, 30)
		llamadaNoLocal1 = new LlamadaNacionalOInternacional(paris, 30)
		llamadaNoLocal2 = new LlamadaNacionalOInternacional(mendozaCapital, 45)

		jonSnow = new Cliente("Juan Nieves", black)
		cerseiLannister = new Cliente("Cersei Lannister", gold)
		
		SistemaDeFacturacion.clientes.clear
		SistemaDeFacturacion.facturasRealizadas.clear
		Factura.resetearNumeroFactura
		SistemaDeFacturacion.mostrarEnConsola = false
	}
}
