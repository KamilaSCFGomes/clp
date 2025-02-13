abstract type MenuAbstrato end

function mostrar_menu(menu::MenuAbstrato)
    opcao = 1
    while opcao != 0    # laço de repetição com condição no início
        println("\n\n\n")
        mostrar_titulo(menu)
        mostrar_opcoes(menu)
        print("INFORME A SUA OPCAO: ")
        # parse converte string para um número de um tipo escolhido
        opcao = executar_opcao(menu, parse(Int, readline()))
    end
end

# Métodos abstratos que devem ser implementados pelas subclasses
function executar_opcao(menu::MenuAbstrato, opcao::Int)
    error("Método executar_opcao() não implementado")
end

function mostrar_opcoes(menu::MenuAbstrato)
    error("Método mostrar_opcoes() não implementado")
end

function mostrar_titulo(menu::MenuAbstrato)
    error("Método mostrar_titulo() não implementado")
end