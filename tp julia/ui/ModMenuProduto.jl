module ModMenuProduto
    include("../Entidades/ModProduto.jl")
    include("../data/ModDAOProduto.jl")
    using .ModProduto, .ModDAOProduto
    import .ModDAOProduto.adicionar as adicionarDAO, .ModDAOProduto.remover as removerDAO

    export MenuProduto, newMenuProduto, listar, adicionar, remover

    struct MenuProduto
        dao::DAOProduto
    end

    newMenuProduto() = MenuProduto(getInstanceDAOProduto())

    function listar(self::MenuProduto)
        println(toString(self.dao))
    end

    function adicionar(self::MenuProduto)
        nome = ""
        valor = 0.0

        while true
            try
                println("\nDigite o nome: ")
                nome = readline()

                println("Digite o valor: ")
                valor = parse(Float64, readline())

                if nome == "" || valor <= 0.0
                    throw(ArgumentError("\nFavor informar os dados corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.msg)
            end
        end
        
        adicionarDAO(self.dao.dao, newProduto(nome, valor))

    end

    function remover(self::MenuProduto)
        nome = ""

        while true
            try
                println("\nDigite o nome: ")
                nome = readline()

                if nome == ""
                    throw(ArgumentError("\nFavor informar o nome corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.msg)
            end
        end

        removerDAO(nome, self.dao)
    end
end