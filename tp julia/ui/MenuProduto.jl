module ui
    using data.DAOProduto

    struct MenuProduto <: MenuEntidade
        dao::DAOProduto = DAOProduto.getInstance()
    end
        
    function mostrarTitulo()
        println("MENU PRODUTOS")
    end

    function listar(self::MenuProdutoProduto)
        println(self.dao.toString()) #refazer
    end

    function adicionar(self::Menu)roduto
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
        
        self.dao.adicionar(nome, valor) #REFAZER
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

        self.dao.remover(nome) #refazer
    end

end