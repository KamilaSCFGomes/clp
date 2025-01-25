module ui

    abstract type MenuAbstrato end

    function mostrarMenu()
        opcao = 0

        while true
            println("\n\n\n")

            mostrarTitulo()
            mostrarOpcoes()

            print("INFORME A SUA OPCAO: ")

            # readline lê uma linha no terminal
            # parse converte números em uma stirng para o tipo especificado
            opcao = executarOpcao(parse(Int, readline()))
            
            # utilizando avaliação curto-circuito como condicional:
            opcao != 0 || break 
        end
    end

    mostrarTitulo() = throw(NotImplementedError("Função não implementada"))

    mostrarOpcoes() = throw(NotImplementedError("Função não implementada"))

    executarOpcao(opcao::Int) = throw(NotImplementedError("Função não implementada"))
end