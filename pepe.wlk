object pepe { 
    var property categoria = cadete

    method sueldo() = categoria.neto() // + bonoRes + bonoPres
}

object cadete {
    method neto() = 20000
}

object gerente {
    method neto() = 15000
}