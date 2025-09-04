object pepe { 
    var categoria = cadete
    var tipoBonoRes = nulo
    var tipoBonoPres = nulo
    var property cantFaltas = 0

    method sueldo() = self.neto() + tipoBonoRes.bonoResultado(self) + tipoBonoPres.bonoResultado(self)

    method neto() = categoria.neto()

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

object cadete {
    method neto() = 20000
}

object gerente {
    method neto() = 15000
}

object nulo {
    method bonoResultado(persona) {
        return 0
    }

    method bonoPresentismo(persona) {
        return 0
    }
}

object montoFijo {
    method bonoResultado(persona) {
        return 800
    }
}

object porcentaje {
    method bonoResultado(persona) {
        return persona.neto() * 0.1
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

object ajuste {
    method bonoPresentismo(persona) {
        if (persona.cantFaltas() == 0) {
            return 100
        }
        else {
            return 0
        }
    }
}

