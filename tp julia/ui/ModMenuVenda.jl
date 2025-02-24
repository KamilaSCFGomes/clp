module ModMenuVenda

    include("./ModMenuEntidade.jl")
    include("../data/ModDAOProduto.jl")
    include("../data/ModDAOVenda.jl")
    include("../Entidades/ModProduto.jl")
    include("../Entidades/ModVenda.jl")
    using .ModMenuEntidade, .ModDAOProduto, .ModDAOVenda, .ModProduto, .ModVenda

    export MenuVenda, newMenuVenda

    struct MenuVenda <: MenuEntidade
        daoVenda::DAOVenda
        daoProduto::DAOProduto
    end

    newMenuVenda() = MenuVenda(getInstanceDAOVenda(), getInstanceDAOProduto())

    function mostrarTitulo(::MenuVenda)
        println("MENU VENDAS")
    end

    function listar(self::MenuVenda)
        println(self.daoVenda.toString()) #refazer
    end
    

    function adicionar(self::MenuVenda)
        produto::Produto
        venda::Venda
        qtd = 0
        
        while true
            while true
                try
                    println("\nDigite o nome do produto: ")
                    produto = self.daoProduto.buscar(readline())

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
        
        venda.adicionarItem(produto, qtd) #REFAZER

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