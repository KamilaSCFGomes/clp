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
end