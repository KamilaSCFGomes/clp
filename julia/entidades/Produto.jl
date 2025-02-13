# estrutura mutável, pois os valores dos campos podem ser alterados
mutable struct Produto <: Entidade  # Produto herda de Entidade
    id::Int64
    nome::String
    valor::Float64

    function Produto() # construtor
        new(round(Int64, time() * 1000), "", 0.0)
    end

        # usando despachamento múltiplo para criar um construtor alternativo
    function Produto(nome::String, valor::Float64)
        new(round(Int64, time() * 1000), nome, valor)
    end
end

# outra forma de escrever os métodos
get_id(produto::Produto) = produto.id

get_nome(produto::Produto) = produto.nome

get_valor(produto::Produto) = produto.valor


#convenção para métodos que alteram o estado do objeto (possuem efeito colateral): terminam com ! (bang)
function set_nome!(produto::Produto, nome::String)
    produto.nome = nome
end

function set_valor!(produto::Produto, valor::Float64)
    produto.valor = valor
end

function Base.show(io::IO, produto::Produto)
    print(io, "Id $(produto.id)\tNome: $(produto.nome)\tValor: $(produto.valor)")

end