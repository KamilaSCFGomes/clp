module ModMenuPrincipal
    include("./ModMenuEntidade.jl")
    using .ModMenuEntidade, .ModMenuEntidade.ModMenuVenda, .ModMenuEntidade.ModMenuProduto
    import .ModMenuProduto.mostrarTitulo, .ModMenuVenda.mostrarTitulo
    export MenuPrincipal, newMenuPrincipal, mostrarOpcoes, executarOpcao

    struct MenuPrincipal
        menuProduto::MenuProduto
        menuVenda::MenuVenda
    end

    function newMenuPrincipal() 
        MenuPrincipal(newMenuProduto(), newMenuVenda())
    end

    

    

end