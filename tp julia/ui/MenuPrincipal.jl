module ui
    struct MenuPrincipal <: MenuAbstrato
        menuProduto::MenuProduto
        menuVenda::MenuVenda
    end

    newMenuPrincipal() = MenuPrincipal(newMenuProduto(), newMenuVenda())


    function executarOpcao(opcao::Int, self::MenuPrincipal)
        if opcao == 0
            return 0
        elseif opcao == 1
            self.menuProduto.mostrarMenu()
            return
        elseif opcao == 2
            self.menuVenda.mostrarMenu()
            return 1
        else #default
            println("OPCAO INVALIDA\n")
        end
                
        return 1
    end

    function mostrarOpcoes()
        println("0 -> FECHAR PROGRAMA")
        println("1 -> PRODUTO")
        println("2 -> VENDA")
    end 
    
    function mostrarTitulo()
        println("MENU PRINCIPAL")
    end

end