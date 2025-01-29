include("./ui/ModMenuAbstrato.jl")
include("./ui/ModMenuPrincipal.jl")
#OLHAR ESSA MERDA DE MOSTRAR MENU

using ui.MenuPrincipal  # Importa o módulo onde está o MenuPrincipal
using ui.MenuAbstrato

import .mostrarMenu

function main()
    # Criando o scanner (em Julia usamos leitura de entrada padrão)
    println("Bem-vindo ao programa!")
    
    # Instanciando e chamando o menu principal
    mostrarMenu(MenuPrincipal())

    println("Programa encerrado.")

end

main()