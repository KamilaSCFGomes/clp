module ModDAO
    include("../Entidades/ModEntidade.jl") 
    using .ModEntidade
    import .ModEntidade.toString

    export DAO, getDados, adicionar, buscar, remover, toString

    mutable struct DAO <: EntidadeAbs
        #vetor de generico chamado dados
        dados::Vector
    end
        
    getDados(self::DAO) = self.dados

    function adicionar(self::DAO, entidade)
        push!(self.dados, entidade)
    end
    
    # estrutura de repetição
    function buscar(id::Int64, self::DAO)
        for p in self.dados
            if(p.getId(p) == id)
                return p
            end
        # nothing é vazio (null)
        return nothing   
        end
    end

    function remover(id::Int64, self::DAO)
        # filtra os elementos do vetor, removendo o
        # que tem o id igual ao parametro
        filter!(e-> e.getId() != id, self.dados)
    end

    function toString(self::DAO)
        s = ""

        for e in self.dados
            # concatenação de todos os elementos do
            # vetor DAOutilizando *
            s *= "\n" * e.toString()
        end
    end
end

# Próximo arquivo: data/ModDAOProduto.jl