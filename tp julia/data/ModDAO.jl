module ModDAO
    include("../Entidades/ModEntidade.jl") 
    using Entidades.Entidade
    import .toString

    export DAO, getDados, adicionar, buscar, remover, toString

    mutable struct DAO{E <: Entidade}
        _dados::Vector{E}
        
        function DAO{E}() where E
            new{E}(Vector{E}())
        end
    end

    getDados(self::DAO) = self._dados

    function adicionar(self::DAO, entidade::E)
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