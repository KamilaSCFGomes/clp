module ModMenuAbstrato
    include("./ModMenuPrincipal.jl")
    using .ModMenuPrincipal, .ModMenuPrincipal.ModMenuEntidade
    using .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda
    using .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda.ModMenuProduto
    import .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda.ModMenuProduto.listar
    import .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda.ModMenuProduto.adicionar
    import .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda.ModMenuProduto.remover

    export MenuAbstrato, mostrarMenu, mostrarTitulo, mostrarOpcoes, executarOpcao

    function mostrarMenu(self)
        opcao = 0

        while true
            println("\n\n\n")

            mostrarTitulo(self)
            mostrarOpcoes(self)

            println("INFORME A SUA OPCAO:")

            opcao = parse(Int, readline())
            executarOpcao(self, opcao) == 0 && break
        end
    end

    mostrarTitulo(::MenuPrincipal) = println("MENU PRINCIPAL")
    mostrarTitulo(::MenuProduto) = println("MENU PRODUTOS")
    mostrarTitulo(::MenuVenda) = println("MENU VENDA")

    function mostrarOpcoes(::MenuPrincipal)
        println("0 -> FECHAR PROGRAMA")
        println("1 -> PRODUTO")
        println("2 -> VENDA")
    end

    function mostrarOpcoes(::Union{MenuVenda, MenuProduto})
        println("0 -> VOLTAR")
        println("1 -> LISTAR")
        println("2 -> ADICIONAR")
        println("3 -> REMOVER")
    end

    function executarOpcao(self::MenuPrincipal, opcao::Int)
        if opcao == 0
            return 0
        elseif opcao == 1
            mostrarMenu(self.menuProduto)
            return 1
        elseif opcao == 2
            mostrarMenu(self.menuVenda)
            return 1
        else
            println("OPCAO INVALIDA\n")
        end
        return 1
    end

    function executarOpcao(self::Union{MenuProduto, MenuVenda}, opcao::Int)
        if opcao == 0
            return 0
        elseif opcao == 1
            listar(self)
            return 1
        elseif opcao == 2
            adicionar(self)
            return 1
        elseif opcao == 3
            remover(self)
            return 1
        else
            println("OPCAO INVALIDA\n")
        end
        return 1
    end
end