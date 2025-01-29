# declarar o módulo e o nome, será utilizado para utilizar esse código
# em outro arquivo
module ModEntidade 
    # especificar o que poderá ser utilizado quando importar esse
    # módulo em outro arquivo
    export Entidade, newEntidade, getId, toString, EntidadeAbs
    # biblioteca Dates importada para utilizar as estruturas e funções
    # de tempo e data
    using Dates

    #= struct é uma estrutura imutável,
       mutable struct é uma estrutura mutável

    tipagem paramétrica flexível: tipagem estática é opcional e
    tipos podem receber parâmetros =#
    abstract type EntidadeAbs end

    struct Entidade
        id :: Integer
    end
    #=  :: ("é uma instância de") especifica o tipo e garante que o
    programa funiconará como o esperado. Dependendo da situação,
    pode melhorar o desempenho do código

    declaração da função newEntidade:
    pega o tempo agora, converte para ms e utiliza o valor como id
    os parâmetros ficam na ordem dos atributos da struct =#
    function newEntidade()
        Entidade(Dates.value(convert(Dates.Millisecond, Dates.now())))
    end
    # se o retorno não é especificado, será a última sentença

    #= declarar uma função de forma concisa:
    se o retorno não é especificado, será a última linha da função =#
    getId(self::Entidade) = self.id

    #=
    para concatenar basta chamar a variável utilizando $, como em
    Perl. Também realiza operações, ex "1 + 2 = $(1 + 2)" e funções =#

    toString(self::Entidade) = "Id: $(self.id)     "
end

# Próximo arquivo: Entidades/Produto.jl