using .UI  # Importa o módulo onde está o MenuPrincipal

function main()
    # Criando o scanner (em Julia usamos leitura de entrada padrão)
    println("Bem-vindo ao programa!")

    # Instanciando e chamando o menu principal
    menu = MenuPrincipal()
    mostrar_menu(menu)

    println("Programa encerrado.")
end

main()