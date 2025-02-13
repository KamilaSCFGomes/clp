using Printf

include("entidades/Entidade.jl")
include("entidades/Produto.jl")
include("entidades/Venda.jl")

include("data/DAO.jl")
include("data/DAOProduto.jl")
include("data/DAOVenda.jl")

include("ui/MenuAbstrato.jl")
include("ui/MenuEntidade.jl")
include("ui/MenuProduto.jl") # a ordem dos imports importa
include("ui/MenuVenda.jl")
include("ui/MenuPrincipal.jl")

function 🤠() # aceita unicode como input e como parte do código, incluindo emojis.
    menu_principal = MenuPrincipal()
    mostrar_menu(menu_principal) 
end

🤠()