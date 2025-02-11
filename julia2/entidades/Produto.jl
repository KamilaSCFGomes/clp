mutable struct Produto <: Entidade  # Agora Produto subtipo de Entidade (tipo abstrato)
    id::Int64
    nome::String
    valor::Float64

    function Produto()
        new(round(Int64, time() * 1000), "", 0.0)  # ID gerado automaticamente
    end

    function Produto(nome::String, valor::Float64)
        new(round(Int64, time() * 1000), nome, valor)  # ID gerado automaticamente
    end
end

function get_id(produto::Produto)
    return produto.id
end

function get_nome(produto::Produto)
    return produto.nome
end

function get_valor(produto::Produto)
    return produto.valor
end

function set_nome!(produto::Produto, nome::String)
    produto.nome = nome
end

function set_valor!(produto::Produto, valor::Float64)
    produto.valor = valor
end

function Base.show(io::IO, produto::Produto)
    print(io, "Id: $(produto.id)\tNome: $(produto.nome)\tValor: $(produto.valor)")
end