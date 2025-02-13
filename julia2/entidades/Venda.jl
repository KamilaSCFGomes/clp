using Dates

# ItemVenda precisa ser compilado antes de Venda, então a ordem foi trocada
mutable struct ItemVenda
    produto::Produto
    qtd::Int64
    valor::Float64

    function ItemVenda(produto::Produto, qtd::Int64)
        new(produto, qtd, produto.valor)
    end
end

get_produto(item::ItemVenda) = item.produto

# uma forma de fazer interpolação de strings é utilizando o comando $()
# torna possível efeituar operações matemáticas e chamadas de funções dentro da string
function Base.show(io::IO, item::ItemVenda)
    print(io, "$(item.produto.nome) $(item.valor) x $(item.qtd) = $(item.valor * item.qtd)")
end

mutable struct Venda <: Entidade
    id::Int64
    dataHora::DateTime  # tipo data-hora
    itens::Vector{ItemVenda} # vetor de ItemVenda

    function Venda()
        new(round(Int64, time() * 1000), now(), []) # [] é um vetor vazio
    end
end

get_dataHora(venda::Venda) = venda.dataHora

get_itens(venda::Venda) = venda.itens

get_id(venda::Venda) = venda.id

function adicionar_item!(venda::Venda, produto::Produto, qtd::Int64)
    push!(venda.itens, ItemVenda(produto, qtd))
end

function remover_item!(venda::Venda, posicao::Int64)
    deleteat!(venda.itens, posicao)
end

function remover_item!(venda::Venda, nomeProduto::String)
    # função de alta ordem: utilizando uma função lambda como parâmetro
    filter!(item -> item.produto.nome != nomeProduto, venda.itens)
end

function total(venda::Venda)
    t = 0.0
    for item in venda.itens # laço de repetição  por estrutura de dados
        t += item.valor * item.qtd
    end
    return t
end

function Base.show(io::IO, venda::Venda)
    println(io, "Id: $(venda.id)")
    println(io, "Data-Hora: $(venda.dataHora)")
    println(io, "Itens:")
    for item in venda.itens # laço de repetição por estrutura de dados
        println(io, "  $(item)")
    end
    println(io, "TOTAL: $(total(venda))")
end