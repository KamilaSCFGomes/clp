abstract type MenuEntidade <: MenuAbstrato end
#estruturas abstratas não possuem implementação, apenas definição

function executar_opcao(menu::MenuEntidade, opcao::Int)
    if opcao == 0   # não possui estrutura de seleção múltipla
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

#=
outra forma de simular uma estrutura de seleção múltipla:
Dicionário que mapeia opções a funções lambda

function executar_opcao(menu::MenuEntidade, opcao::Int)
    
    opcoes = Dict(
        0 => () -> return 0,
        1 => () -> listar(menu),
        2 => () -> adicionar(menu),
        3 => () -> remover(menu)
    )

    if haskey(opcoes, opcao) # Verifica se a opção existe no dicionário
        opcoes[opcao]  # Executa a função correspondente à opção
    else
        println("OPCAO INVALIDA\n")
    end

    return 1
end
=#

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