module ModDAOVenda
    include("../Entidades/ModVenda.jl") 
    using Entidades.Venda
    import .toString
    export DAOVenda, getInstance, adicionar, buscar, remover, toString

    struct DAOVenda
        _instance::DAOVenda
        _dao::DAO{Venda}
    
        function DAOProduto()
            new(DAOProduto(), DAO{Produto}())
        end
    end

    getInstance(self::DAOVenda) = self._instance

    function adicionar(self::DAOVenda, p::Produto)
        push!(self._dao, p)
    end

    function buscar(id::Int64, self::DAOVenda)
        self._dao.buscar(id, self._dao);
    end

    function remover(id::Int64, self::DAOVenda)
        self._dao.remover(id)
    end

    function toString(self::DAOVenda)
        return self._dao.toString();
    end

    
end