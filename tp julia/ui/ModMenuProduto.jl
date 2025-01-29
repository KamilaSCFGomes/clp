module ModMenuProduto
    include("../Entidades/ModEntidade.jl")
    include("../data/ModDAOProduto.jl")
    include("./ModMenuEntidade.jl")
    using .ModEntidade, .ModDAOProduto, .ModMenuEntidade
    import .mostrarTitulo, .listar, .adicionar, .remover
    export MenuProduto, newMenuProduto

    struct MenuProduto <: MenuEntidade
        dao::DAOProduto
    end

    newMenuProduto() = MenuProduto(getInstanceDAOProduto)
        
    function mostrarTitulo()
        println("MENU PRODUTOS")
    end

    function listar(self::MenuProduto)
        println(self.dao.toString()) 
    end

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
        
        self.dao.adicionar(nome, valor) 
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

        self.dao.remover(nome) 
    end

end