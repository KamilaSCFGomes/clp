module ModMenuEntidade
    include("./ModMenuVenda.jl")
    using .ModMenuVenda, .ModMenuVenda.ModMenuProduto
    import .executarOpcao

    export MenuEntidade, executarOpcao
    
    abstract type MenuEntidade end

    listar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.listar"))

    adicionar() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.adicionar"))

    remover() = throw(NotImplementedError("Função não implementada - ModMenuEntidade.remover"))
    
end 
