module ModTotalizavel

    #abstract type Totalizavel end

    function total(obj::Totalizavel)::Float32 # retorno da função deve ser Float32
        #avisa erro, caso tentativa de chamar sem implementação
        throw(NotImplementedError("Função não implementada"))
    end

end

# Próximo arquivo: Entidades/Venda.jl