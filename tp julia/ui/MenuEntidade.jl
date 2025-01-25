module ui

    struct MenuEntidade <: MenuAbstrato end

    function listar() 
        throw(MethodError("listar", ()))
    end

    function adicionar() 
        throw(MethodError("adicionar", ()))
    end

    function remover() 
        throw(MethodError("remover", ()))
    end

    #=
    julia não possui estrutura de seleção múltipla (como switch-case)
    existem algumas opções de macro e bibliotecas (como a match) para implementar
    seleção múltipla, mas a solução mais utilizada é uma sequência de estruturas
    de seleção de 2 caminhos (if-else) =#

    function executarOpcao(opcao::Int)
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
end 
