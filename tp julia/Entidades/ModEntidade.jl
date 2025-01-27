module ModEntidade
    using Dates
    # biblioteca Dates importada para utilizar a função now

    #=
    struct é uma estrutura imutável, mutable struct é uma estrutura
    mutável

    tipagem paramétrica flexível: tipagem estática é opcional e
    tipos podem receber parâmetros, pode definir tamanhos =#
    struct Entidade
        id:: Integer
    end

    #=
    declaração da função newEntidade de forma concisa:
    pega o tempo agora, converte para ms e utiliza o valor como id =#
    newEntidade() = Entidade(Dates.value(convert(Dates.Millisecond, Dates.now())))

    #=
    função getId não é necessária, já que a estrutura é imutável
    mas permite ler seus valores =#

    #=
    para concatenar basta chamar a variável utilizando $, como em
    Perl. Também realiza operações, ex "1 + 2 = $(1 + 2)"

    outra forma de declarar uma função:
    se o retorno não é especificado, será a última linha da função=#
    function toString(self::Entidade)
        "Id: $(self.id)\t"
    end
end
# Próximo arquivo: Entidades/Produto.jl