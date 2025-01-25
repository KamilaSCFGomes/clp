using .Entidade
#=
mutable string é uma string mutavel
<: é utilizado para indicar hierarquia
o atributo EntDados simula a herança =#
    mutable struct Produto
        e::EntDados
        nome::String
        valor::Float32
    end

    # sobrecarga da função newProduto:
    newProduto() = Produto(newEntDados(), "", 0.0)
    
    newProduto(nome::String, valor::Float32) = Produto(newEntDados(), nome, valor)


    getNome(self::Produto) = self.nome
    
    getValor(self::Produto) = self.valor

    setNome(self::Produto, nome::String) = self.nome = nome
    
    setValor(self::Produto, valor::Float32) = self.valor = valor

    toString(self::Produto) = "$(toString(self.e))Nome: $(self.nome)\tValor:$(self.valor)"

# Próximo arquivo: Entidades/Totalizavel.jl