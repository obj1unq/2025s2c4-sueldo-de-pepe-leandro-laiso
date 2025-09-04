object pepe { 
    var categoria = cadete
    var tipoBonoRes = nulo
    var tipoBonoPres = nulo
    var property cantFaltas = 0

    method sueldo() = self.neto() + tipoBonoRes.bonoResultado(self) + tipoBonoPres.bonoPresentismo(self)

    method neto() = categoria.neto()

    method noFaltóNunca() = self.cantFaltas() == 0

    method categoria(_categoria) {
        categoria = _categoria
    }

    method tipoBonoRes(_tipoBonoRes) {
        tipoBonoRes = _tipoBonoRes
    }

    method tipoBonoPres(_tipoBonoPres) {
        tipoBonoPres = _tipoBonoPres
    }
}

object sofia {
    var categoria = cadete
    var tipoBonoRes = nulo

    method sueldo() = self.neto() + tipoBonoRes.bonoResultado(self)

    method neto() = categoria.neto() * 1.3

    method categoria(_categoria) {
        categoria = _categoria
    }

    method tipoBonoRes(_tipoBonoRes) {
        tipoBonoRes = _tipoBonoRes
    }
}

object roque {
    var tipoBonoRes = nulo

    method sueldo() = self.neto() + tipoBonoRes.bonoResultado(self) + 9000

    method neto() = 28000

    method tipoBonoRes(_tipoBonoRes) {
        tipoBonoRes = _tipoBonoRes
    }
}

// CATEGORÍAS
object cadete {
    method neto() = 20000
}

object gerente {
    method neto() = 15000
}

object vendedor {
    var hayAumentoPorMuchasVentas = false
    const netoBase = 16000

    method neto() {
        if (hayAumentoPorMuchasVentas) {
            return netoBase * 1.25
        }
        else {
            return netoBase
        }
    }

    method activarAumentoPorMuchasVentas() {
        hayAumentoPorMuchasVentas = true
    }

    method desactivarAumentoPorMuchasVentas() {
        hayAumentoPorMuchasVentas = false
    }
}

object medioTiempo {
    var categoriaBase = null
    
    method neto() = categoriaBase.neto() / 2

    method categoriaBase(categoria) {
        categoriaBase = categoria
    }   
}


// BONOS
object nulo {
    method bonoResultado(persona) {
        return 0
    }

    method bonoPresentismo(persona) {
        return 0
    }
}

object porcentaje {
    method bonoResultado(persona) {
        return persona.neto() * 0.1
    }
}

object montoFijo {
    method bonoResultado(persona) {
        return 800
    }
}

object normal {
    method bonoPresentismo(persona) {
        if (persona.noFaltóNunca()) {
            return 2000
        }
        else {
            return self.bonoSegunCantFaltas(persona)
        }
    }

    method bonoSegunCantFaltas(persona) {
        if (persona.cantFaltas() == 1) {
            return 1000
        }
        else {
            return 0
        }
    }
}

object ajuste {
    method bonoPresentismo(persona) {
        if (persona.noFaltóNunca()) {
            return 100
        }
        else {
            return 0
        }
    }
}

object demagogico {
    method bonoPresentismo(persona) {
        if (persona.neto() < 18000) {
            return 500
        }
        else {
            return 300
        }
    }
}
