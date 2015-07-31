package dominio

import org.eclipse.xtend.lib.annotations.Accessors

class TipoDeAbono {
	
	@Accessors
	double abonoMensual
	
	new(int abono){
		this.abonoMensual = abono
	}
	
}