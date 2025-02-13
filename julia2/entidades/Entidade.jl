abstract type Entidade end #tipo abstrato

mutable struct EntidadeConcreta <: Entidade #o tipo concreto herda do tipo abstrato
    id::Int64 #tipagem explícita

    function EntidadeConcreta() #construtor
        new(round(Int64, time() * 1000))
    end
end

function get_id(entidade::EntidadeConcreta)::Int64 #método com tipo de retorno definido (::Int64)
    return entidade.id
end

# substituindo a função toString, do java:
# despachamento múltiplo da função show, que pertence à base da Julia
function Base.show(io::IO, entidade::EntidadeConcreta)
    print(io, "Id: $(entidade.id)\t")
end