![Logo](https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg)

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
* A partir da versão 3.2 não temos mais constantes FIXNUM e BIGNUM, que separam os inteiros.
### Fixnums
* Têm características interesss que ajudam na manipulação mais rápida pela linguagem, que os definem como _immediate values_ *que são tipos de dados apontados por variáveis que armazenam seus valores na própria referência e não em um objeto que teve memória alocada para ser utilizado, agilizando bastante o seu uso.*  para verificar se ma referência se comporta dessa forma, vamos utilizar o método _object-id_, que é um valor único da referência de memória.
* Dica: Todo objeto em Ruby pode ser identificado pelo seu _object-id_
### Bignums
* Como vimos acima, os Fixnums têm limites nos seus valores, dependendo da plataforma. Os _bignums_ são os números inteiros que excedem o limite imposto pelos _Fixnums_, ou seja, em um computador de 64 bits:

```(2 ** 62)
 => 4611686018427387904 
 (2 ** 62).object_id & 0x1
 => 0

 ``````
* Bignums _alocam memória_, enquanto os Fixnums são _immediate values._
# Atenção:
* Com _immediate values_, vas varáveis contêm os próprios objetos em vez de referẽncias a eles.

## Importante: para versões anterioes a Ruby 3.2

Tanto para Fixnums como para Bignums, podemos escrever números utilizando o sublinhado (_) como separador:

```
> 1_234_567
=> 1234567
> 1_234_567_890
=> 1234567890

```
### Importante
* A partir da versão do Ruby 3.2 tanto Fixnums como Bignums tornaram-se _Integers (z)

### Ponto Flutuante
* Floates podem ou não ser _immediate values_.

### BigDecimals
* Não são _immediate values_
* Não estão incluídos automaticamente e precisam ser requisitados explicitamente.


```
> require 'bigdecimal'
=> true
> total = BigDecimal(0.0, 2)
=> 0.0
```

### Datas

```
> require 'date'
# retorna a data corrente
> Date.today
=> 2023-01-04

```

### Horas
```
> Time.now
=> 2023-01-04 19:28:53.057388545 -0300
# cria somente com data e horas, minutos e segundos zerados
> Time.new('2023-02-01')
=> 2023-02-01 00:00:00 -0300
# cria com horas, minutos e segundos e transforma em uma String
> Time.new('2023-02-01 01:02:03')

```
### Racionais
* Em matemática, um número racional é todo número que pode ser representado
por uma fração ab de dois números inteiros, um numerador a e um denominador
não nulo b. Como b pode ser igual a 1, todo número inteiro também é um número
racional. O termo racional surge do fato de ab representar a razão ou proporção
entre os inteiros a e b.
O conjunto dos números racionais é representado por Q (ou alternativamente por
Q), sendo o uso da letra "Q"derivado da palavra latina quotiē(n)s, cujo significado
é "quantas vezes".

```
> Rational(1,3)
=> (1/3)
> Rational(1,3) * 9

```

