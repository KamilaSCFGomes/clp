module ModMenuProduto
    include("../Entidades/ModEntidade.jl")
    include("../data/ModDAOProduto.jl")
    using .ModEntidade, .ModDAOProduto
    import .mostrarTitulo, .listar, .adicionar, .remover
    export MenuProduto

    struct MenuProduto <: MenuEntidade
        _dao::DAOProduto
    end
        
    function _mostrarTitulo()
        println("MENU PRODUTOS")
    end

    function _listar(self::MenuProduto)
        println(self._dao.toString()) #refazer
    end

    function _adicionar(self::MenuProduto)
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
        
        self._dao.adicionar(nome, valor) #REFAZER
    end

    function _remover(self::MenuProduto)
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

        self._dao.remover(nome) #refazer
    end

end