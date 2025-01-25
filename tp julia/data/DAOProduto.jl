module data

    using Entidades.Produto

    struct DAOProduto
        instance::DAOProduto
        dao::DAO{Produto}

        function DAOProduto()
            new(DAOProduto(), DAO{Produto}())
        end
    end

    getInstance(self::DAOProduto) = self.instance

    function adicionar(self::DAOProduto, p::Produto)
        push!(self.dao, p)
    end

    function buscar(id::Int64, self::DAOProduto)
        self.dao.buscar(id, *);
    end

end