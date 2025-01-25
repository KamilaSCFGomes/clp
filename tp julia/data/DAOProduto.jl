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
        self.dao.buscar(id, self.dao);
    end

    function buscar(nome::String, self::DAOProduto)
        for p in self.dao.getDados()
            if(p.getNome() == nome)
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

    function toString(self::DAOProduto)
        return self.dao.toString()
    end

end