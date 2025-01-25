module ui
    struct MenuPrincipal <: MenuAbstrato
        menuProduto::MenuProduto
        menuVenda::MenuVenda
    end

    newMenuPrincipal = MenuPrincipal()

end