    include("./ModEntidade.jl") #inclui o diretório do arquivo
    using .ModEntidade: Entidade, newEntidade, toString #especifica o que será usado
    import .ModEntidade.toString # é necessário para executar a sobrecarga
#=
mutable string é uma string mutavel
<: é utilizado para indicar hierarquia
o atributo EntDados simula a herança =#
    mutable struct ProDados
        e::Entidade
        nome::String
        valor::Float64
    end

    # envio dinâmico da função newProDados:
    newProDados() = ProDados(newEntidade(), "", 0.0)::ProDados
    newProDados(nome::String, valor::Float64)::ProDados = ProDados(newEntidade(), nome, valor)
    #= semelhante a sobrecarga, mas a sobrecarga é definida em tempo
    de compilação, enquanto o envio dinâmico é resolvido em tempo de
    execução =#
    
    #a::ProDados = newProDados("Penis de 30cm",2.99)
    #b = toString(a)

    getNome(self::ProDados) = self.nome
    
    getValor(self::ProDados) = self.valor

    setNome(self::ProDados, nome::String) = self.nome = nome
    
    setValor(self::ProDados, valor::Float64) = self.valor = valor

    toString(self::ProDados) = "$(toString(self.e))Nome: $(self.nome)\tValor:$(self.valor)"

# Próximo arquivo: Entidades/Totalizavel.jl