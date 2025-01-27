module ModProduto
    include("./ModEntidade.jl") #inclui o diretório do arquivo
        using .ModEntidade: Entidade, newEntidade, toString #especifica o que será usado
        import .ModEntidade.toString # é necessário para executar a sobrecarga
    #=
    mutable string é uma string mutavel
    <: é utilizado para indicar hierarquia
    o atributo EntDados simula a herança =#
        mutable struct Produto
            e::Entidade
            nome::String
            valor::Float64
        end

        # envio dinâmico da função newProduto:
        newProduto() = Produto(newEntidade(), "", 0.0)::Produto
        newProduto(nome::String, valor::Float64)::Produto = Produto(newEntidade(), nome, valor)
        #= semelhante a sobrecarga, mas a sobrecarga é definida em tempo
        de compilação, enquanto o envio dinâmico é resolvido em tempo de
        execução =#

        getNome(self::Produto) = self.nome
        
        getValor(self::Produto) = self.valor

        setNome(self::Produto, nome::String) = self.nome = nome
        
        setValor(self::Produto, valor::Float64) = self.valor = valor

        # sobrecarga de toString
        toString(self::Produto) = "$(toString(self.e))Nome: $(self.nome)       Valor:$(self.valor)"

        # Próximo arquivo: Entidades/Totalizavel.jl

    end