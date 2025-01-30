module ModDAO
    include("../Entidades/ModEntidade.jl") 
    using .ModEntidade
    import .ModEntidade.toString

    export DAO, getDados, adicionar, buscar, remover, toString

    mutable struct DAO <: EntidadeAbs
        dados::Vector
    end
        
    getDados(self::DAO) = self.dados

    adicionar(self::DAO, entidade) = push!(self.dados, entidade)

    function buscar(id::Int64, self::DAO)
        for p in self.dados
            if(p.getId(p) == id)
                return p
            end
        
        return nothing   
        end
    end

    remover(id::Int64, self::DAO) = filter!(e-> e.getId() != id, self.dados)

    function toString(self::DAO)
        s = ""

        for e in self.dados
            s *= "\n" * e.toString()
        end
    end
    
end