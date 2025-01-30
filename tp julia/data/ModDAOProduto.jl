module ModDAOProduto
    include("../Entidades/ModProduto.jl")
    include("./ModDAO.jl")
    using .ModProduto, .ModDAO
    import .ModDAO.toString, .ModDAO.buscar, .ModDAO.adicionar, .ModDAO.remover
    export DAOProduto, getInstanceDAOProduto, adicionar, buscar, remover, toString

    struct DAOProduto
        dao::DAO
    end

    const SGT_DAOPRODUTO = Ref{Union{Nothing, DAOProduto}}(nothing)

    function getInstanceDAOProduto()
        # == verifica se o valor dos operandos são iguais
        # === verifica se os operandos são exatamente iguais
        # ex: 1 == 1.0 é true, 1 === 1.0 é false
        if SGT_DAOPRODUTO[] === nothing 
            SGT_DAOPRODUTO[] = DAOProduto(DAO([]))
        end
        return SGT_DAOPRODUTO[]
    end

    adicionar(self::DAOProduto, p::Produto) = adicionar(self.dao, p)

    buscar(id::Int64, self::DAOProduto) = buscar(id, self.dao);

    function buscar(nome::String, self::DAOProduto)
        for p in getDados(self.dao)
            if(getNome(p) == nome)
                return p
            end
        end
        return nothing
    end

    function remover(id::Int64, self::DAOProduto)
        self.dao.remover(id)
    end

    function remover(nome::String, self::DAOProduto)
        filter!(e -> e.getNome() != nome, self.getDados())
    end

    toString(self::DAOProduto) = toString(self.dao)

end