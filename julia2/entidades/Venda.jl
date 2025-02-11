using Dates

mutable struct ItemVenda
    produto::Produto
    qtd::Int64
    valor::Float64

    function ItemVenda(produto::Produto, qtd::Int64)
        new(produto, qtd, produto.valor)
    end
end

function get_produto(item::ItemVenda)
    return item.produto
end

function Base.show(io::IO, item::ItemVenda)
    print(io, "$(item.produto.nome) $(item.valor) x $(item.qtd) = $(item.valor * item.qtd)")
end

mutable struct Venda <: Entidade
    dataHora::DateTime
    itens::Vector{ItemVenda}

    function Venda()
        new(now(), [])
    end
end

function get_dataHora(venda::Venda)
    return venda.dataHora
end

function get_itens(venda::Venda)
    return venda.itens
end

function adicionar_item!(venda::Venda, produto::Produto, qtd::Int64)
    push!(venda.itens, ItemVenda(produto, qtd))
end

function remover_item!(venda::Venda, posicao::Int64)
    deleteat!(venda.itens, posicao)
end

function remover_item!(venda::Venda, nomeProduto::String)
    filter!(item -> item.produto.nome != nomeProduto, venda.itens)
end

function total(venda::Venda)
    t = 0.0
    for item in venda.itens
        t += item.valor * item.qtd
    end
    return t
end

function Base.show(io::IO, venda::Venda)
    println(io, "Data-Hora: $(venda.dataHora)")
    println(io, "Itens:")
    for item in venda.itens
        println(io, "  $(item)")
    end
    println(io, "TOTAL: $(total(venda))")
end