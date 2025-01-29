module ModDAOProduto
    include("../Entidades/ModProduto.jl") 
    using Entidades.ModProduto
    import .toString
    export DAOProduto, getInstance, adicionar, buscar, remover, toString

    struct DAOProduto
        _instance::DAOProduto
        _dao::DAO{Produto}

        function DAOProduto()
            new(DAOProduto(), DAO{Produto}())
        end
    end

    getInstance(self::DAOProduto) = self._instance

    function adicionar(self::DAOProduto, p::Produto)
        push!(self._dao, p)
    end

    function buscar(id::Int64, self::DAOProduto)
        self._dao.buscar(id, self._dao);
    end

    function buscar(nome::String, self::DAOProduto)
        for p in self._dao.getDados()
            if(p.getNome() == nome)
                return p
            end
        end

        return nothing
    end

    function remover(id::Int64, self::DAOProduto)
        self._dao.remover(id)
    end

    function remover(nome::String, self::DAOProduto)
        filter!(e -> e.getNome() != nome, self.getDados())
    end

    function toString(self::DAOProduto)
        return self._dao.toString()
    end

end