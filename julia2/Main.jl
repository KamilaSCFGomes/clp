# Main.jl
using Printf

# Carregando os arquivos na ordem correta
include("entidades/Entidade.jl")
include("entidades/Produto.jl")
include("entidades/Totalizavel.jl")
include("entidades/Venda.jl")

include("data/DAO.jl")
include("data/DAOProduto.jl")
include("data/DAOVenda.jl")

include("ui/MenuAbstrato.jl")
include("ui/MenuEntidade.jl")
include("ui/MenuProduto.jl")  # MenuProduto.jl deve ser carregado antes de MenuPrincipal.jl
include("ui/MenuVenda.jl")    # MenuVenda.jl deve ser carregado antes de MenuPrincipal.jl
include("ui/MenuPrincipal.jl")

# Função principal
function main()
    # Inicia o menu principal
    menu_principal = MenuPrincipal()
    mostrar_menu(menu_principal)
end

# Executa o programa
main()