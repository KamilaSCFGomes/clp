module Produto

    include("Entidade.jl")
    using .Entidade
#=
mutable string é uma string mutavel
<: é utilizado para indicar hierarquia
o atributo EntDados simula a herança =#
    mutable struct ProDados
        e::EntDados
        nome::String
        valor::Float64
    end

    # sobrecarga da função newProDados:
    newProDados() = ProDados(newEntDados(), "", 0.0)::ProDados
    
    newProDados(nome::String, valor::Float64)::ProDados = ProDados(newEntDados(), nome, valor)

    #a::ProDados = newProDados("Penis de 30cm",2.99)
    #b = toString(a)

    getNome(self::ProDados) = self.nome
    
    getValor(self::ProDados) = self.valor

    setNome(self::ProDados, nome::String) = self.nome = nome
    
    setValor(self::ProDados, valor::Float64) = self.valor = valor

    toString(self::ProDados) = "$(toString(self.e))Nome: $(self.nome)\tValor:$(self.valor)"

end
# Próximo arquivo: Entidades/Totalizavel.jl