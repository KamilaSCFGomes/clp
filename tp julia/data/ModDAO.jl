module ModDAO
    include("../Entidades/ModEntidade.jl") 
    using .ModEntidade
    import .ModEntidade.toString

    export DAO, getDados, adicionar, buscar, remover, toString

    mutable struct DAO{E} <: EntidadeAbs
        _dados::Vector{E}
    end

    getDados(self::DAO) = self._dados

    function adicionar(self::DAO, entidade)
        push!(self._dados, entidade)
    end

    function buscar(id::Int64, self::DAO)
        for p in self._dados
            if(p.getId(p) == id)
                return p
            end
        
        return nothing   
        end
    end

    function remover(id::Int64, self::DAO)
        filter!(e-> e.getId() != id, self._dados)
    end

    function toString(self::DAO)
        s = ""

        for e in self._dados
            s *= "\n" * e.toString()
        end
    end
end