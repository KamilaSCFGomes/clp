module ModDAO
    include("../Entidades/ModEntidade.jl") 
    using .ModEntidade
    import .ModEntidade.toString

    export DAO, getDados, adicionar, buscar, remover, toString

    mutable struct DAO{E} <: EntidadeAbs
        dados::Vector{E}
    end

    getDados(self::DAO) = self.dados

    function adicionar(self::DAO, entidade)
        push!(self.dados, entidade)
    end

    function buscar(id::Int64, self::DAO)
        for p in self.dados
            if(p.getId(p) == id)
                return p
            end
        
        return nothing   
        end
    end

    function remover(id::Int64, self::DAO)
        filter!(e-> e.getId() != id, self.dados)
    end

    function toString(self::DAO)
        s = ""

        for e in self.dados
            s *= "\n" * e.toString()
        end
    end
end