module data

    using Entidades.Venda

    struct DAOVenda
        instance::DAOVenda
        dao::DAO{Venda}
    
        function DAOProduto()
            new(DAOProduto(), DAO{Produto}())
        end
    end

    getInstance(self::DAOVenda) = self.instance

    function adicionar(self::DAOVenda, p::Produto)
        push!(self.dao, p)
    end

    function buscar(id::Int64, self::DAOVenda)
        self.dao.buscar(id, self.dao);
    end

    function remover(id::Int64, self::DAOVenda)
        self.dao.remover(id)
    end

    function toString(self::DAOVenda)
        return self.dao.toString();
    end

    
end