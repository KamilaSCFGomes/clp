abstract type MenuEntidade <: MenuAbstrato end

function executar_opcao(menu::MenuEntidade, opcao::Int)
    if opcao == 0
        return 0
    elseif opcao == 1
        listar(menu)
    elseif opcao == 2
        adicionar(menu)
    elseif opcao == 3
        remover(menu)
    else
        println("OPCAO INVALIDA\n")
    end
    return 1
end

function mostrar_opcoes(menu::MenuEntidade)
    println("0 -> VOLTAR")
    println("1 -> LISTAR")
    println("2 -> ADICIONAR")
    println("3 -> REMOVER")
end

# Métodos abstratos que devem ser implementados pelas subclasses
function listar(menu::MenuEntidade)
    error("Método listar() não implementado")
end

function adicionar(menu::MenuEntidade)
    error("Método adicionar() não implementado")
end

function remover(menu::MenuEntidade)
    error("Método remover() não implementado")
end