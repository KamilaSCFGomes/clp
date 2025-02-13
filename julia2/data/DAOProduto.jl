mutable struct DAOProduto
    dao::DAO{Produto}

    function DAOProduto()
        new(DAO{Produto}())
    end
end

# Singleton instance para DAOProduto
# pode ser implementado utilizando constante ou uma estrutura vazia
const instance_produto = DAOProduto()

function get_instance_produto()
    return instance_produto
end

function adicionar!(dao_produto::DAOProduto, produto::Produto)
    adicionar!(dao_produto.dao, produto)
end

function buscar(dao_produto::DAOProduto, id::Int64)
    return buscar(dao_produto.dao, id)
end

function buscar(dao_produto::DAOProduto, nome::String)
    for produto in get_dados(dao_produto.dao)
        if get_nome(produto) == nome
            return produto
        end
    end
    
    return nothing
end

function remover!(dao_produto::DAOProduto, id::Int64)
    remover!(dao_produto.dao, id)
end

#função de alta ordem: utilizando uma comparação com uma função lambda como parâmetro
function remover!(dao_produto::DAOProduto, nome::String)
    filter!(🤰 -> get_nome(🤰) != nome, get_dados(dao_produto.dao))
end

function Base.show(io::IO, dao_produto::DAOProduto)
    show(io, dao_produto.dao)
end
