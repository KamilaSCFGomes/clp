module ModVenda
    include("./ModTotalizavel.jl")
    include("./ModEntidade.jl")
    include("./ModProduto.jl")
    using .ModEntidade
    using .ModTotalizavel
    using .ModProduto
    using Dates
    import .ModEntidade.toString, .ModTotalizavel.total
    export Venda, getDataHora, getItens, toString, adicionarItem!, removerItem!, total, getProduto

    # Venda precisa de ItemVenda, então a declaração precisa ocorrer primeiro

    mutable struct ItemVenda
        _produto::Produto
        _qtd::Int
        _valor::Float64
    end

    function newItemVenda(produto::Produto, qtd::Int)
        valor=getValor(produto)
        ItemVenda(produto, qtd, valor)
    end 

    mutable struct Venda <: EntidadeAbs
        e::Entidade
        _dataHora::DateTime
        _itens::Vector{ItemVenda} #vetor de ItemVenda chamado itens
    end
    
    newVenda() = Venda(newEntidade(), now(), ItemVenda[])
    
    getDataHora(self::Venda) = self._dataHora

    getItens(self::Venda) = self._itens

    function toString(self::Venda)
        #concatenação de strings por interpolação
        s = "$(self.e.toString())Data-Hora: $(self.dataHora)\nItens:\n"

        for i in self._itens
            #concatenação utilizando *
            s *= "\n " * i.toString()
        end

        s *= "\nTOTAL: " * total(self)
    end

    function total(self::Venda)::Float64 
        t = 0.0

        for item in self._itens
            t += item.valor * item.qtd
        end
        
        return t
    end

    #=
    funções com ! (por convenção) indicam que há efeito colateral se
    não tiver !, a função retorna uma cópia modificada do dado original =#

    function adicionarItem!(self::Venda, produto::Produto, qtd::Int)
        push!(self._itens, ItemVenda(produto, qtd, getValor(produto)))
    end

    function removerItem!(self::Venda, posicao::Int)
        deleteat!(self._itens, posicao)
        #pop!(self.itens, posicao)
    end
    
    #=
    filter cria uma nova lista com itens de nome != do parametro, 
    percorrendo todos os itens da lista =# 

    function removerItem!(self::Venda, nomeProduto::String)
        self._itens = filter(i->i.produto.nome == nomeProduto, self._itens)
    end 

    getProduto(self::ItemVenda) = self._produto
    
    function toString(self::ItemVenda)
        "$(self.produto.getNome()) $(self._valor) $(self._qtd) $(self._valor * self._qtd)"
    end
    
end

# Próximo arquivo: Entidades/Venda.jl