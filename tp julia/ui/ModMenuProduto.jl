module ModMenuProduto
    include("../Entidades/ModProduto.jl")
    include("../data/ModDAOProduto.jl")
    using .ModProduto, .ModDAOProduto
    import .ModDAOProduto.adicionar, .ModDAOProduto.remover
    export MenuProduto, newMenuProduto, listar, adicionar, remover

    struct MenuProduto
        dao::DAOProduto
    end

    newMenuProduto() = MenuProduto(getInstanceDAOProduto())

    listar(self::MenuProduto) = println(self.dao.toString()) 

    function adicionar(self::MenuProduto)
        nome = nothing
        valor = 0.0

        while true
            try
                println("\nDigite o nome: ")
                nome = readline()

                println("Digite o valor: ")
                valor = parse(Float64, readline())

                # isnothing(nome) equivale a nome == null em outras linguagens
                if isnothing(nome) || nome == "" || valor <= 0.0
                    throw(ArgumentError("\nFavor informar os dados corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.message)
            end
        end
        
        adicionar(self.dao, newProduto(nome, valor))
    end

    function remover(self::MenuProduto)
        nome = nothing

        while true
            try
                println("\nDigite o nome: ")
                nome = readline()

                if nome == "" || isnothing(nome)
                    throw(ArgumentError("\nFavor informar o nome corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.message)
            end
        end

        remover(nome, self.dao) 
    end

end