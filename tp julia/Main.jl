include("./ui/ModMenuAbstrato.jl")
using .ModMenuAbstrato, .ModMenuAbstrato.ModMenuPrincipal

function main()
    # Criando o scanner (em Julia usamos leitura de entrada padrão)
    println("Bem-vindo ao programa!")
    
    # Instanciando e chamando o menu principal
    mostrarMenu(newMenuPrincipal())

    println("Programa encerrado.")

end

main()