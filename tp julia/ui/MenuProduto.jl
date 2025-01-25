module ui
    using data.DAOProduto

    struct MenuProduto <: MenuEntidade
        dao::DAOProduto
    end

    dao = DAOProduto.getInstance()
        
    function mostrarTitulo()
        println("MENU PRODUTOS")
    end

    function listar()
        println(dao.toString())
    end

    function adicionar()
        nome = nothing
        valor = 0.0

        while true
            try
                println("\nDigite o nome: ")
                nome = readline()

                println("Digite o valor: ")
                valor = parse(Float64, readline())

                if isnothing(nome) || nome == "" || valor <= 0.0
                    throw(ArgumentError("\nFavor informar os dados corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.message)
            end
        end
        
        dao.adicionar(nome, valor) #REFAZER
    end

    function remover(menu::MenuProduto, entrada::IO)
        nome = ""

        while true
            try
                println("\nDigite o nome: ")
                nome = readline(entrada)

                if nome == "" || nome == nothing
                    throw(ArgumentError("\nFavor informar o nome corretamente.\n"))
                else
                    break
                end
            catch ex
                println("Erro: ", ex.message)
            end
        end

        menu.dao.remover(nome)
    end

end