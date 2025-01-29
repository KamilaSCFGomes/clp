module ModMenuVenda

    include("./ModMenuEntidade.jl")
    include("../data/ModDAOProduto.jl")
    include("../data/ModDAOVenda.jl")
    include("../Entidades/ModProduto.jl")
    include("../Entidades/ModVenda.jl")

    using ModMenuEntidade
    
    using data.DAOProduto
    using data.DAOVenda

    using Entidades.Produto
    using Entidades.Venda

    export MenuVenda, _mostrarTitulo, _listar, _adicionar, _remover

    struct MenuVenda <: MenuEntidade
        _daoVenda::DAOVenda = DAOVenda.getInstance()
        _daoProduto::DAOProduto = DAOProduto.getInstance()
    end

    function _mostrarTitulo()
        println("MENU PRODUTOS")
    end

    function _listar(self::MenuEntidade)
        println(self._daoVenda.toString()) #refazer
    end
    

    function _adicionar(self::MenuEntidade)
        produto::Produto
        venda::Venda
        qtd = 0
        
        while true
            while true
                try
                    println("\nDigite o nome do produto: ")
                    produto = self._daoProduto.buscar(readline())

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

        self._daoVenda.adicionar(venda)  #refazer
    end

    function _remover(self::MenuVenda)
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

        self._daoVenda.remover(id) #refazer
    end
end