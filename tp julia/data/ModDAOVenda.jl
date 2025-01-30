module ModDAOVenda
    include("../Entidades/ModVenda.jl")
    include("../Entidades/ModProduto.jl")
    include("./ModDAO.jl")
    using .ModVenda, .ModDAO, .ModProduto
    import .ModDAO.toString, .ModDAO.buscar, .ModDAO.adicionar, .ModDAO.remover
    export DAOVenda, getInstanceDAOVenda, adicionar, buscar, remover, toString

    struct DAOVenda
        dao::DAO
    end

    const SGT_DAOVENDA = Ref{Union{Nothing, DAOVenda}}(nothing)

    function getInstanceDAOVenda()
        # == verifica se o valor dos operandos são iguais
        # === verifica se os operandos são exatamente iguais
        # ex: 1 == 1.0 é true, 1 === 1.0 é false
        if SGT_DAOVENDA[] === nothing 
            SGT_DAOVENDA[] = DAOVenda(DAO([]))
        end
        return SGT_DAOVENDA[]
    end

    function adicionar(self::DAOVenda, p::Produto)
        adicionar(self.dao, p)
    end

    function buscar(id::Int64, self::DAOVenda)
        buscar(id, self.dao);
    end

    function remover(id::Int64, self::DAOVenda)
        remover(id, self.dao)
    end

    toString(self::DAOVenda) = self.dao.toString()
    
end