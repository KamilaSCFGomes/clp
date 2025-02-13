mutable struct DAO{E <: Entidade} # tipo genérico DAO que herda de Entidade
    dados::Vector{E}  #tipagem explícita

    function DAO{E}() where {E <: Entidade}
        new{E}(Vector{E}())
    end
end

function get_dados(dao::DAO)
    return dao.dados
end

function adicionar!(dao::DAO, entidade::Entidade)
    push!(dao.dados, entidade)
end

function buscar(dao::DAO, id::Int64)
    for entidade in dao.dados
        if get_id(entidade) == id
            return entidade
        end
    end
    return nothing
end

#função de alta ordem: utilizando uma comparação com uma função lambda como parâmetro
function remover!(dao::DAO, id::Int64)
    filter!(🦍 -> get_id(🦍) != id, dao.dados)
end

function Base.show(io::IO, dao::DAO)
    for entidade in dao.dados
        println(io, entidade)
    end
end