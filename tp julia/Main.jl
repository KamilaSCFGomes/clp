using ui.MenuPrincipal  # Importa o módulo onde está o MenuPrincipal

function main()
    # Criando o scanner (em Julia usamos leitura de entrada padrão)
    println("Bem-vindo ao programa!")

    # Instanciando e chamando o menu principal
    mostrarMenu(MenuPrincipal())

    println("Programa encerrado.")
end

main()