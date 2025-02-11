# MenuProduto.jl
mutable struct MenuProduto <: MenuEntidade
    dao::DAOProduto

    function MenuProduto()
        new(get_instance_produto())
    end
end

function mostrar_titulo(menu::MenuProduto)
    println("MENU PRODUTOS")
end

function listar(menu::MenuProduto)
    println(menu.dao)
end

function adicionar(menu::MenuProduto)
    nome = ""
    valor = 0.0

    while true
        try
            print("\nDigite o nome: ")
            nome = readline()
            print("Digite o valor: ")
            valor = parse(Float64, readline())

            if isempty(nome) || valor <= 0.0
                throw(ErrorException("\nFavor informar os dados corretamente.\n"))
            else
                break
            end
        catch ex
            println(ex.msg)
        end
    end

    adicionar!(menu.dao, Produto(nome, valor))
end

function remover(menu::MenuProduto)
    nome = ""

    while true
        try
            print("\nDigite o nome: ")
            nome = readline()

            if isempty(nome)
                throw(ErrorException("\nFavor informar o nome corretamente.\n"))
            else
                break
            end
        catch ex
            println(ex.msg)
        end
    end

    remover!(menu.dao, nome)
end