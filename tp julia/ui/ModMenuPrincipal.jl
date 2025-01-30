module ModMenuPrincipal
    include("./ModMenuAbstrato.jl")
    include("./ModMenuProduto.jl")
    include("./ModMenuVenda.jl")
    include("./ModMenuEntidade.jl")
    using .ModMenuAbstrato, .ModMenuProduto, .ModMenuVenda, .ModMenuEntidade
    import .ModMenuAbstrato.mostrarTitulo

    export MenuPrincipal, newMenuPrincipal

    struct MenuPrincipal <: MenuAbstrato
        menuProduto::MenuProduto
        menuVenda::MenuVenda
    end

    function newMenuPrincipal() 
        MenuPrincipal(newMenuProduto(), newMenuVenda())
    end

    function executarOpcao(opcao::Int, self::MenuPrincipal)
        if opcao == 0
            return 0
        elseif opcao == 1
            mostrarMenu(self.menuProduto)
            return
        elseif opcao == 2
            mostrarMenu(self.menuVenda)
            return 1
        else #default
            println("OPCAO INVALIDA\n")
        end
                
        return 1
    end

    function mostrarOpcoes(::MenuPrincipal)
        println("0 -> FECHAR PROGRAMA")
        println("1 -> PRODUTO")
        println("2 -> VENDA")
    end 
    
    function mostrarTitulo()
        println("MENU PRINCIPAL")
    end

end