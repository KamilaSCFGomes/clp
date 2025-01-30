module ModMenuVenda

    include("../data/ModDAOVenda.jl")
    include("../Entidades/ModVenda.jl")
    include("./ModMenuProduto.jl")
    using .ModMenuProduto, .ModMenuProduto.ModDAOProduto, .ModDAOVenda
    
    export MenuVenda, newMenuVenda, listar, adicionar, remover

    struct MenuVenda
        daoVenda::DAOVenda
        daoProduto::DAOProduto
    end

    newMenuVenda() = MenuVenda(getInstanceDAOVenda(), getInstanceDAOProduto())

    listar(self::MenuVenda) = println(self.daoVenda.toString())

    function adicionar(self::MenuVenda)
        produto::Produto = nothing
        venda::Venda = newVenda()
        qtd = 0
        
        while true
            while true
                try
                    println("\nDigite o nome do produto: ")
                    produto = buscar(self.daoProduto, readline())

                    println("Digite a quantidade: ")
                    qtd = parse(Int, readline())

                    if isnothing(produto) || qtd <= 0
                        throw(ArgumentError("\nFavor informar os dados corretamente.\n"))
                    else
                        break
                    end
                catch ex
                    println("Erro: ", ex.message)
                end
            end
        end
        
        adicionarItem(venda, produto, qtd) #REFAZER

        print("\nDeseja adicionar outro produto à venda (1-SIM/0-NAO)? ")

        if(readline() != 1)
            return
        end

        println("\n\nNOTA FISCAL\n" + venda.toString()) #refazer

        self.daoVenda.adicionar(venda)  #refazer
    end

    function remover(self::MenuVenda)
        id :: Int64 = 0 

        while true
            try
                println("\nDigite o id: ")
                id = parse(Int, readline())

                if id <= 0.0
                    throw(ArgumentError("\nFavor informar os dados corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.message)
            end
        end

        self.daoVenda.remover(id) #refazer
    end
end