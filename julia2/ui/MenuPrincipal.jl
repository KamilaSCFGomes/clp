mutable struct MenuPrincipal <: MenuAbstrato
    menu_produto::MenuProduto
    menu_venda::MenuVenda

    function MenuPrincipal()
        new(MenuProduto(), MenuVenda())
    end
end

function executar_opcao(menu::MenuPrincipal, opcao::Int)
    if opcao == 0 # não possui estrutura de seleção múltipla
        return 0
    elseif opcao == 1
        mostrar_menu(menu.menu_produto) # dispacho múltiplo: mostrar menu pode chamar a execução para MenuProduto ou para MenuVenda
    elseif opcao == 2
        mostrar_menu(menu.menu_venda)
    else
        println("OPCAO INVALIDA\n")
    end
    return 1
end

function mostrar_opcoes(menu::MenuPrincipal)
    println("0 -> FECHAR PROGRAMA")
    println("1 -> PRODUTO")
    println("2 -> VENDA")
end

function mostrar_titulo(menu::MenuPrincipal)
    println("MENU PRINCIPAL")
end
