module ModMenuEntidade
    include("./ModMenuAbstrato.jl")
    using .ModMenuAbstrato
    import .executarOpcao

    export MenuEntidade, executarOpcao
    
    abstract type MenuEntidade <: MenuAbstrato end

    listar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.listar"))

    adicionar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.adicionar"))

    remover() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.remover"))

    #= julia não possui estrutura de seleção múltipla (como switch-case)
    existem algumas opções de macro e bibliotecas (como a match) para implementar
    seleção múltipla, mas a solução mais utilizada é uma sequência de estruturas
    de seleção de 2 caminhos (if-else) =#

    function executarOpcao(menu::MenuAbstrato,opcao::Int)
        if opcao == 0
            return 0
        elseif opcao == 1
            listar()
            return 1
        elseif opcao == 2
            adicionar()
            return 1
        elseif opcao == 3
            remover()
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
    
end 
