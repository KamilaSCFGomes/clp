using Dates
# biblioteca Dates importada para utilizar a função now

#   struct é uma estrutura imutável
#   mutable struct é uma estrutura mutável
struct Entidade
    id
    # tipagem paramétrica flexível: tipagem estática é opcional
    # e tipos podem receber parâmetros, pode definir tamanhos
end

function newEntidade() # NÃO TERMINEI ESSE
    Dates.Millisecond(Dates.now())
    aa = Entidade(now())
    println(aa.id)

end
# função getId não é necessária, já que a estrutura é imutável
# mas permite ler seus valores

# para adaptar uma linguagem orientada a objetos para uma
# imperativa,uma função que pertenceria a entidade se torna uma
# função que recebe uma entidade

function toString(self::Entidade)
    # para concatenar ou interpolar, basta chamar a variável
    # desejada utilizando $, como em Perl. Também pode ser
    # utilizado para realizar operações, ex "1 + 2 = $(1 + 2)"
    # também funciona com vetores,onde que $v o imprime inteiro
    "Id: $(self.id)\t"

    # não é necessário especificar o retorno, por padrão a
    # última linha da função será definida como retorno
end

println(toString(Entidade(now()))) #teste

# Próximo arquivo: Entidades/Produto.jl