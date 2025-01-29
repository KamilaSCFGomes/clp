module ModMenuPrincipal
    include("./ModMenuAbstrato.jl")
    include("./ModMenuProduto.jl")
    include("./ModMenuVenda.jl")
    using .ModMenuAbstrato, .ModMenuProduto, .ModMenuVenda
    import .mostrarTitulo

    struct MenuPrincipal <: MenuAbstrato
        _menuProduto::MenuProduto
        _menuVenda::MenuVenda
    end

    function newMenuPrincipal() 
        menu = MenuPrincipal(newMenuProduto(), newMenuVenda())
        newMenuAbstrato(menu)
        menu
    end

    function _executarOpcao(opcao::Int, self::MenuPrincipal)
        if opcao == 0
            return 0
        elseif opcao == 1
            self._menuProduto.mostrarMenu()
            return
        elseif opcao == 2
            self._menuVenda.mostrarMenu()
            return 1
        else #default
            println("OPCAO INVALIDA\n")
        end
                
        return 1
    end

    function _mostrarOpcoes()
        println("0 -> FECHAR PROGRAMA")
        println("1 -> PRODUTO")
        println("2 -> VENDA")
    end 
    
    function _mostrarTitulo()
        println("MENU PRINCIPAL")
    end

end