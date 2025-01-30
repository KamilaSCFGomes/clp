module ModMenuAbstrato
    include("./ModMenuPrincipal.jl")
    using .ModMenuPrincipal, .ModMenuPrincipal.ModMenuEntidade
    using .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda
    using .ModMenuPrincipal.ModMenuEntidade.ModMenuVenda.ModMenuProduto
    export MenuAbstrato, mostrarMenu, mostrarTitulo, mostrarOpcoes, executarOpcao

    function mostrarMenu(self)
        opcao = 0

        while true
            println("\n\n\n")

            mostrarTitulo(self)
            mostrarOpcoes(self)

            println("INFORME A SUA OPCAO:")

            # readline lê uma linha no terminal
            # parse converte números em uma stirng para o tipo especificado
            opcao = executarOpcao(self, parse(Int, readline()))
            
            # utilizando avaliação curto-circuito como condicional:
            opcao == 0 && break 
        end
    end
    
    mostrarTitulo(::MenuPrincipal) = println("MENU PRINCIPAL")
    mostrarTitulo(::MenuProduto) = println("MENU PRODUTOS")
    mostrarTitulo(::MenuVenda) = println("MENU PRODUTOS")

    
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

    #= julia não possui estrutura de seleção múltipla (como switch-case)
    existem algumas opções de macro e bibliotecas (como a match) para implementar
    seleção múltipla, mas a solução mais utilizada é uma sequência de estruturas
    de seleção de 2 caminhos (if-else) =#
    
    function executarOpcao(self::MenuPrincipal, opcao::Int)
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

    function executarOpcao(menu,opcao::Int)
        if opcao == 0
            return 0
        elseif opcao == 1
            listar(menu)
            return 1
        elseif opcao == 2
            adicionar(menu)
            return 1
        elseif opcao == 3
            remover(menu)
            return 1
        else #default
            println("OPCAO INVALIDA\n")
        end
        return 1
    end



end