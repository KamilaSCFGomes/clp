module ModDAOVenda
    include("../Entidades/ModVenda.jl")
    include("../Entidades/ModProduto.jl")
    include("./ModDAO.jl")
    using .ModVenda, .ModDAO, .ModProduto
    import .ModDAO.toString
    export DAOVenda, getInstanceDAOVenda, adicionar, buscar, remover, toString

    struct DAOVenda
        dao::DAO{Venda}
    end

    const SGT_DAOVENDA = Ref{Union{Nothing, DAOVenda}}(nothing)

    function getInstanceDAOVenda()
        if isnothing(SGT_DAOVENDA[])
            # Cria a instância da DAOVenda se não existir
            SGT_DAOVENDA[] = DAOVenda(DAO{Venda}())  # Ajuste conforme seu tipo de DAO
        end
        return SGT_DAOVENDA[]
    end

    function adicionar(self::DAOVenda, p::Produto)
        push!(self.dao, p)
    end

    function buscar(id::Int64, self::DAOVenda)
        self.dao.buscar(id, self.dao);
    end

    function remover(id::Int64, self::DAOVenda)
        self.dao.remover(id)
    end

    toString(self::DAOVenda) = self.dao.toString()
    
end