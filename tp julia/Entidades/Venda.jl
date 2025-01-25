module Venda
    using Dates

    mutable struct Venda <: Entidade <: Totalizavel
        e::EntDados
        dataHora::DateTime
        itens::Vector{ItemVenda} #vetor de ItemVenda chamado itens
    end
    
    newVenda() = Venda(newEntDados, now(), itens::Array)
    
    getDataHora(self::Venda) = self.dataHora

    getItens(self::Venda) = self.itens

    function toString(self::Venda)
        #concatenação de strings por interpolação
        s = "$(self.e.toString())Data-Hora: $(self.dataHora)\nItens:\n"

        for i in self.itens 
            #concatenação utilizando *
            s *= "\n " * i.toString()
        end

        s *= "\nTOTAL: " * self.total
    end

    function total(self::Venda)::Float64 
        t = 0.0

        for item in self.itens
            t += item.valor * item.qtd
        end
        
        return t
    end

    
    
    mutable struct ItemVenda
        produto::Produto
        qtd::Int
        valor::Float32
    end

    newItemVenda(produto::Produto, qtd::Int) = ItemVenda(produto, qtd, produto.getValor())

    #=
    funções com ! (por convenção) indicam que há efeito colateral
    se não tiver !, a função retorna uma cópia modificada do original =#

    function adicionarItem!(self::Venda, produto::Produto, qtd::Int)
        push!(self.itens, ItemVenda(produto, qtd, produto.getValor))
    end

    function removerItem!(posicao::Int)
        deleteat!(self.itens, posicao)
        #pop!(self.itens, posicao)
    end
    
    #=
    filter cria uma nova lista com itens de nome != do parametro, 
    percorrendo todos os itens da lista =# 

    function removerItem!(nomeProduto::String)
        self.itens = filter(i->i.produto.nome == nomeProduto, self.itens)
    end 

    getProduto(self::ItemVenda) = self.produto
    
    function toString(self::ItemVenda)
        "$(self.produto.getNome()) $(self.valor) $(self.qtd) $(self.valor * self.qtd)"
    end
    
end

# Próximo arquivo: Entidades/Venda.jl