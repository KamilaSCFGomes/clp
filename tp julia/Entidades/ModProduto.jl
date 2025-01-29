module ModProduto
    include("./ModEntidade.jl") # inclui o diretório do arquivo
    using .ModEntidade # especifica o módulo que será usado
    import .toString # é necessário para executar asobrecarga

    export Produto, newProduto, getNome, getValor, setNome, setValor, toString
    #=
    mutable string é uma string mutavel
    <: é utilizado para indicar hierarquia
    o atributo Entidados simula a herança =#
        mutable struct Produto <:EntidadeAbs
            e::Entidade
            _nome::String
            _valor::Float64
        end

        # envio dinâmico da função newProduto:
        newProduto() = Produto(newEntidade(), "", 0.0)
        newProduto(nome::String, valor::Float64)::Produto = Produto(newEntidade(), nome, valor)
        #= semelhante a sobrecarga, mas a sobrecarga é definida em tempo
        de compilação, enquanto o envio dinâmico é resolvido em tempo de
        execução =#

        getNome(self::Produto) = self._nome
        
        getValor(self::Produto) = self._valor

        setNome(self::Produto, nome::String) = self._nome = nome
        
        setValor(self::Produto, valor::Float64) = self._valor = valor

        # sobrecarga de toString
        toString(self::Produto) = "$(toString(self.e))Nome: $(self._nome)       Valor:$(self._valor)"

        # Próximo arquivo: Entidades/Totalizavel.jl

end