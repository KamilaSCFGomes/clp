abstract type Entidade end

mutable struct EntidadeConcreta <: Entidade
    id::Int64

    function EntidadeConcreta()
        new(round(Int64, time() * 1000))  # Simula o ID baseado no tempo atual
    end
end

function get_id(entidade::EntidadeConcreta)
    return entidade.id
end

function Base.show(io::IO, entidade::EntidadeConcreta)
    print(io, "Id: $(entidade.id)\t")
end