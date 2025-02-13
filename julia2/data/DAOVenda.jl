mutable struct DAOVenda
    dao::DAO{Venda}

    function DAOVenda()
        new(DAO{Venda}())
    end
end

# Singleton instance para DAOVenda
const instance_venda = DAOVenda()

function get_instance_venda()
    return instance_venda
end

function adicionar!(dao_venda::DAOVenda, venda::Venda)
    adicionar!(dao_venda.dao, venda)
end

function buscar(dao_venda::DAOVenda, id::Int64)
    return buscar(dao_venda.dao, id)
end

#função de alta ordem: utilizando uma comparação com uma função lambda como parâmetro
function remover!(dao_venda::DAOVenda, id::Int64)
    remover!(dao_venda.dao, id)
end

function Base.show(io::IO, dao_venda::DAOVenda)
    show(io, dao_venda.dao)
end