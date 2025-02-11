# MenuVenda.jl
mutable struct MenuVenda <: MenuEntidade
    dao_venda::DAOVenda
    dao_produto::DAOProduto

    function MenuVenda()
        new(get_instance_venda(), get_instance_produto())
    end
end

function mostrar_titulo(menu::MenuVenda)
    println("MENU VENDAS")
end

function listar(menu::MenuVenda)
    println(menu.dao_venda)
end

function adicionar(menu::MenuVenda)
    venda = Venda()
    produto = nothing
    qtd = 0

    while true
        while true
            try
                print("\nDigite o nome do produto: ")
                produto = buscar(menu.dao_produto, readline())
                print("Digite a quantidade: ")
                qtd = parse(Int, readline())

                if produto === nothing || qtd <= 0
                    throw(ErrorException("\nFavor informar os dados corretamente.\n"))
                else
                    break
                end
            catch ex
                println(ex.msg)
            end
        end

        adicionar_item!(venda, produto, qtd)

        print("\nDeseja adicionar outro produto à venda (1-SIM/0-NAO)? ")
        if parse(Int, readline()) != 1
            break
        end
    end

    println("\n\nNOTA FISCAL\n", venda)
    adicionar!(menu.dao_venda, venda)
end

function remover(menu::MenuVenda)
    id = 0

    while true
        try
            print("\nDigite o id: ")
            id = parse(Int64, readline())

            if id <= 0
                throw(ErrorException("\nFavor informar os dados corretamente.\n"))
            else
                break
            end
        catch ex
            println(ex.msg)
        end
    end

    remover!(menu.dao_venda, id)
end