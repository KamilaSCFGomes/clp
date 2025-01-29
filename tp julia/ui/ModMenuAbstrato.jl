module ModMenuAbstrato
    export MenuAbstrato, mostrarMenu

    
    abstract type MenuAbstrato end
    #uso de underscore/underline por convencao de protected
    _mostrarTitulo(self::MenuAbstrato) = throw(NotImplementedError("Função não implementada - ModMenuAbstrato.mostrarTitulo"))

    _mostrarOpcoes(self::MenuAbstrato) = throw(NotImplementedError("Função não implementada - ModMenuAbstrato.mostrarOpcoes"))

    _executarOpcao(self::MenuAbstrato, opcao::Int) = throw(NotImplementedError("Função não implementada - ModMenuAbstrato.executarOpcao"))

    function mostrarMenu(self::MenuAbstrato)
        opcao = 0

        while true
            println("\n\n\n")

            _mostrarTitulo(self)
            _mostrarOpcoes(self)

            print("INFORME A SUA OPCAO: ")

            # readline lê uma linha no terminal
            # parse converte números em uma stirng para o tipo especificado
            opcao = _executarOpcao(self, parse(Int, readline()))
            
            # utilizando avaliação curto-circuito como condicional:
            opcao != 0 || break 
        end
    end

    newMenuAbstrato(self::MenuAbstrato) = mostrarMenu(self)

end