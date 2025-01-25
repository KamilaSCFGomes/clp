module Entidade

    using Dates
    #= biblioteca Dates importada para utilizar as funções de
    data e hora

    tipagem paramétrica flexível: tipagem estática é opcional e
    tipos podem receber parâmetros, pode definir tamanhos

    tipos abstratos permitem organização de uma hierarquia,
    mas eles não podem ter atributos então os atributos são
    definidos em uma struct separada =#
    
    struct EntDados
        id::Int32
    end

    #=
    struct é uma estrutura imutável,
    mutable struct é uma estrutura mutável

    declaração da função newEntidade de forma concisa:
    pega o tempo agora, converte para ms e utiliza o valor como id =#

    newEntDados() = EntDados(Dates.value(convert(Dates.Millisecond, Dates.now())))

    getId(self::EntDados) = self.id
    #=
    função getId não é necessária, já que a estrutura é imutável
    mas permite ler seus valores
    

    para concatenar utilizando interpolação basta chamar a variável
    utilizando $, como em Perl. Tambem pode realizar opetações e funções

    outra forma de declarar uma função:
    se o retorno não é especificado, será a última linha da função=#
    function toString(self::EntDados)
        "Id: $(self.id)\t"
    end

end

# Próximo arquivo: Entidades/Produto.jl