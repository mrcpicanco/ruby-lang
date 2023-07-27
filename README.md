# O que é Ruby?
* Ruby é uma linguagem de programação interpretada multiparadigma, de tipagem
dinâmica e forte, com gerenciamento de memória automático, originalmente pla-
nejada e desenvolvida no Japão em 1995, por Yukihiro "Matz"Matsumoto, para
ser usada como linguagem de script. Matsumoto queria desenvolver uma lingua-
gem de script que fosse mais poderosa do que Perl, e mais orientada a objetos
do que Python. Ruby suporta programação funcional, orientada a objetos, impe-
rativa e reflexiva. Foi inspirada principalmente por Python, Perl, Smalltalk, Eiffel,
Ada e Lisp, sendo muito similar em vários aspectos a Python. Ruby está entre
as 10 linguagens mais populares, de acordo com uma pesquisa conduzida pela
RedMonk.
A implementação 1.8.7 padrão é escrita em C, como uma linguagem de progra-
mação de único passe. Não há qualquer especificação da linguagem, assim a
implementação original é considerada de fato uma referência. Atualmente, há
várias implementações alternativas da linguagem, incluindo YARV, JRuby, Rubi-
nius, IronRuby, MacRuby e HotRuby, cada qual com uma abordagem diferente,
com IronRuby, JRuby e MacRuby fornecendo compilação JIT e, JRuby e Ma-
cRuby também fornecendo compilação AOT. A partir das séries 1.9 em diante
Ruby passou a utilizar por padrão a YARV (Yet Another Ruby VirtualMachine)
substituindo a Ruby MRI (Matz’s Ruby Interpreter)

# Básico da linguagem
## Tipagem dinâmica
* Não exige declaração de tipos de dados

## Tipagem forte
* O tipo de dados de um valor deve ser o mesmo do tipo da variável ao qual este valor será atribuído.
## Tipos Básicos
* Não possui tipos primitivos, apenas abstratos (todos possuem comportamento de objetos)
* A partir da versão 3.2 não temos mais constantes FIXNUM e BIGNUM, que separam os nteiros como
