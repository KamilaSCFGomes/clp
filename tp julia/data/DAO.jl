module data
    using Entidades.Entidade

    mutable struct DAO{E <: Entidade}
        dados::Vector{E}
        
        function DAO{E}() where E
            new{E}(Vector{E}())
        end
    end
    
    getDados(self::DAO) = self.dados

    function adicionar(self::DAO, entidade::E)
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