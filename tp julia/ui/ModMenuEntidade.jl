module ModMenuEntidade
    include("./ModMenuAbstrato.jl")
    using .ModMenuAbstrato
    import ._executarOpcao

    export MenuEntidade, _executarOpcao
    
    struct MenuEntidade <: MenuAbstrato end

    _listar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.listar"))

    _adicionar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.adicionar"))

    _remover() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.remover"))

    #= julia não possui estrutura de seleção múltipla (como switch-case)
    existem algumas opções de macro e bibliotecas (como a match) para implementar
    seleção múltipla, mas a solução mais utilizada é uma sequência de estruturas
    de seleção de 2 caminhos (if-else) =#

    function _executarOpcao(menu::MenuAbstrato,opcao::Int)
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

    function _mostrarOpcoes()
        println("0 -> FECHAR PROGRAMA")
        println("1 -> PRODUTO")
        println("2 -> VENDA")
    end 
    
end 
