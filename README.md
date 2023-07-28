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
### Booleanos
* Temos mais dois immediate values que são os booleanos, os tradicionais true e false,
indicando como object_id, respectivamente, 2 e 0:

```
> true.object_id
=> 2
> false.object_id
=> 0

```
### Nulos
* O tipo nulo em Ruby é definido como nil. Ele também é um immediate value, com o valor
fixo de 4 no seu object_id:
```
> nil.object_id
=> 4

```
### Strings
* Strings são cadeias de caracteres, que podemos criar delimitando esses caracteres com aspas
simples ou duplas, como por exemplo "azul"ou 'azul', podendo utilizar simples ou duplas dentro
da outra como "o céu é 'azul'"ou 'o céu é "azul"'e "escapar"utilizando o caracter \:

```
puts "o céu é 'azul'"
puts "o céu é \"azul\""
puts 'o céu é "azul"'
puts 'o céu é \'azul\''

```
### Substrings
* Substrings são partes de uma String (antes eu havia escrito "pedaços"de uma String,
mas ficou um lance muito Tokyo Ghoul/Hannibal Lecter, então achei "partes"mais bonito).
Para pegar algumas substrings, podemos tratar a String como um Array:

```
> str = "string"
=> "string"
> str[0..2]
=> "str"
> str[3..4]
=> "in"
> str[4..5]
=> "ng"

```

### Simbolos
* Símbolos, antes de mais nada, são instâncias da classe Symbol. Podemos pensar em um sím-
bolo como uma marca, um nome, onde o que importa não é o que contém a sua instância, mas
o seu nome.

```
> :teste.class
=> Symbol
> :teste.object_id
=> 263928
> :teste.object_id
=> 263928

```

###Expressões Regulares
* Outra coisa muito útil em Ruby é o suporte para expressões regulares (regexps). Elas podem ser
facilmente criadas das seguintes maneiras:

```
> regex1 = /^[0-9]/
=> /^[0-9]/
> regex2 = Regexp.new("^[0-9]")
=> /^[0-9]/
> regex3 = %r{^[0-9]}
=> /^[0-9]/



```
### Testes

```
> "1 teste" =~ regex1
=> 0
> "1 teste" =~ regex2
=> 0
> "1 teste" =~ regex3
=> 0
> "outro teste" !~ regex1
=> true
> "outro teste" !~ regex2
=> true
> "outro teste" !~ regex3
=> true
> "1 teste" !~ regex1
=> false

```

### Atenção
* A partir da versão 3.2, o operador =~ não funciona mais para outros objetos que
não sejam Strings.

### Timeout
* partir da versão 3.2 temos o método timeout, que nos permite definir um tempo máximo
para as expressões serem avaliadas. Mas para que diabos queremos isso? Imaginem uma
situação em que a aplicação vai demorar muito tempo para avaliar uma determinada expressão
com algum conteúdo enviado pelo usuário, e nós sabemos que usuários podem enviar de tudo se
não tomarmos cuidado, certo? Pegando o exemplo baseado na documentação da linguagem (se
você tiver um computador muito rápido, pode ter que aumentar o número de caracteres):

```
> Regexp.timeout = 0.1
> /^a*b?a*$/ =~ "a" * 5_000_000 + "x"
=> Regexp match timeout (Regexp::TimeoutError)
```
* A configuração do timeout acima é global. Se quisermos definir por expressão regular, podemos
especificar timeout na expressão:

```
> Regexp.timeout = 1.0
> /^a*b?a*$/ =~ "a" * 5_000_000 + "x"
=> nil
> expr = Regexp.new("^a*b?a*$", timeout: 0.1)
=> /^a*b?a*$/
> expr =~ "a" * 5_000_000 + "x"
=> Regexp match timeout (Regexp::TimeoutError)

```
### Arrays
*  Arrays podemos definir como objetos que contém coleções de referências para outros objetos.
Vamos ver um Array simples com números:

```
> array = [1, 2, 3, 4, 5]
=> [1, 2, 3, 4, 5]
```
* Em Ruby os Arrays podem conter tipos de dados diferentes também, como esse onde mistura-
mos inteiros, flutuantes e Strings:
```
> array = [1, 2.3, "oi"]
=> [1, 2.3, "oi"]
```

```
Dica
Para criarmos Arrays de Strings o método convencional é:
array = ["um", "dois", "tres", "quatro"]
=> ["um", "dois", "tres", "quatro"]
mas temos um atalho que nos permite economizar digitação com as aspas, que é o %w e
pode ser utilizado da seguinte maneira:
array = %w(um dois tres quatro)
=> ["um", "dois", "tres", "quatro"]
e também podemos utilizar %i para criar um Array de símbolos:
%i(um dois tres quatro)
=> [:um, :dois, :tres, :quatro]
Os delimitadores podem ser tanto () como vimos acima, como também [] ou mesmo {},
dependendo do conteúdo que estiver dentro, se for algum dos delimitadores. Podem ser
alterados à vontade.

```

```
Dica
Temos um atalho em Ruby que nos permite economizar conversões dentro de Strings. Ao
invés de usarmos to_s como mostrado acima, podemos utilizar o que é conhecido como
interpolador de expressão com a sintaxe #objeto, onde tudo dentro das chaves vai ser
transformado em String acessando o seu método to_s. Ou seja, poderíamos ter escrito
o código do bloco como:
{ |numero| puts "O Array tem o numero #{numero}" }

```
### Duck Typing
* Pudemos ver que o operador/método « funciona de maneira similar em Strings e Arrays, e
isso é um comportamento que chamamos de Duck Typing, baseado no duck test, de James
Whitcomb Riley, que diz o seguinte:
```
Se parece com um pato, nada como um pato, e faz barulho como um pato, então
provavelmente é um pato.

```
* Isso nos diz que, ao contrário de linguagens de tipagem estática, onde o tipo do objeto é veri-
ficado em tempo de compilação, em Ruby nos interessa se um objeto é capaz de exibir algum
comportamento esperado, não o tipo dele.
Se você quer fazer uma omelete, não importa que animal que está botando o ovo (galinha, pata,
avestruz, Tiranossauro Rex, etc), desde que você tenha um jeito/método para botar o ovo.
"Ei, mas como vou saber se um determinado objeto tem um determinado método?"Isso é fá-
cil de verificar utilizando o método respond_to?:

```
> String.new.respond_to?(:<<)
=> true
> Array.new.respond_to?(:<<)
=> true

```

* "Ei, mas eu realmente preciso saber se o objeto em questão é do tipo que eu quero. O método
« é suportado por Arrays, Strings, Integers mas tem comportamento diferente nesses
últimos!". Nesse caso, você pode verificar o tipo do objeto utilizando kind_of?:

```
> String.new.kind_of?(String)
=> true
> 1.kind_of?(Integer)
=> true
> 1.kind_of?(Numeric)
=> true
> 1.kind_of?(Bignum)
=> false

```

* De qualquer forma, o conceito de duck typing de Ruby nos remete ao princípio de substituição
de Liskov, que é o "L"em SOLID SOLID, que estabelece que:

```
A visão de "subtipo"defendida por Liskov e Wing é baseada na noção da substi-
tuição; isto é, se S é um subtipo de T, então os objetos do tipo T, em um programa,
podem ser substituídos pelos objetos de tipo S sem que seja necessário alterar
as propriedades deste programa.
```

### Ranges
* Ranges são intervalos em que existe a intenção de criar um intervalo, não a sua instanciação,
ou seja, definimos os limites, mas não criamos os objetos dentro desses limites. Nos limites
podemos definir incluindo ou não o último valor referenciado. Vamos exemplificar isso com o uso
de iteradores, dessa maneira:

```
> range1 = (0..10)
=> 0..10
> range2 = (0...10)
=> 0...10
> range1.each { |valor| print "#{valor} " }
=> 0 1 2 3 4 5 6 7 8 9 10
=> 0..10
> range2.each { |valor| print "#{valor} " }
=> 0 1 2 3 4 5 6 7 8 9
=> 0...10

```
* Como pudemos ver, as Ranges são declaradas com um valor inicial e um valor final, separadas
por dois ou três pontos, que definem se o valor final vai constar ou não no intervalo.

```
Dica
Para se lembrar qual da duas opções que incluem o valor, se lembre que nesse caso menos
é mais, ou seja, com dois pontos temos mais valores.

```
### Criando Ranges com Strings:
```
> ("a".."z").each { |valor| print "#{valor} " }
=> a b c d e f g h i j k l m n o p q r s t u v w x y z
=> "a".."z"
> ("ab".."az").each { |valor| print "#{valor} " }
=> ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az
=> "ab".."az"

```
* Converter uma Range em um Array, mas atenção: aqui saímos da intenção
de ter os objetos para a instanciação dos objetos, ou seja, não tentem fazer isso com um intervalo
de milhões de objetos:

```
> ("a".."z").to_a
=> ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
"p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

```
* As Ranges também podem ser infinitas, com um valor inicial e sem o valor final:

```
> range = (10..)
=> 10..
> range.take(5)
=> [10, 11, 12, 13, 14]

```
* Novamente, fica o conselho de não tentar fazer a instanciação de todos os objetos para um
Array, até porque para o caso de Ranges infinitas isso irá gerar uma exceção do tipo RangeError.

### Hashes

* As Hashes são, digamos, Arrays indexados, com chaves e valores, que podem ser quaisquer
tipos de objetos, sendo o valor especificado no lado esquerdo, o operador de atribuição do valor
sendo => (mais sobre ele mais adiante) e o valor do lado direito, como por exemplo:

```
> hash = { :john => "guitarra e voz", :paul => "baixo e voz", :george => "guitarra", :
ringo => "bateria" }
=> {:john=>"guitarra e voz", :paul=>"baixo e voz", :george=>"guitarra", :ringo=>"bateria
"}
```
### Conversões de Tipo
```
# Integer para Float
> 1.to_f
=> 1.0
# Integer para String
> 1.to_s
=> "1"
# String para Integer
> "1".to_i
=> 1
# String inválida para Integer
> "a".to_i
=> 0
# String inválida para Integer, dando erro
> Integer("a")
=> ArgumentError (invalid value for Integer(): "a")
# String para flutuante
> "1".to_f
=> 1.0
# String para símbolo
> "azul".to_sym
=> :azul
# Array para String
> [1, 2, 3, 4, 5].to_s
=> "[1, 2, 3, 4, 5]"
# Array para String, com delimitador
> [1, 2, 3, 4, 5].join(",")
=> "1,2,3,4,5"
# Range para Array
> (0..10).to_a
=> [0,1,2,3,4,5,6,7,8,9,10]
# Hash para Array
> { john: "guitarra e voz" }.to_a
=> [ [:john, "guitarra e voz"] ]
```

### Conversões de Bases
```
De inteiro para binário:

> 2.to_s(2)
=> "10"
De binário para decimal:

> "10".to_i(2)
=> 2
> 0b10.to_i
=> 2
De inteiro para hexadecimal:

> 10.to_s(16)
=> "a"
De hexadecimal para inteiro:

> 0xa.to_i
=> 10

```

### Tratamento de Exceções
* Exceções nos permitem "cercar"erros que acontecem no nosso programa (afinal, ninguém é
perfeito, não é mesmo?) em um objeto que depois pode ser analisado e tomadas as devidas
providências ao invés de deixar o erro explodir dentro do nosso código levando à resultados in-
desejados. Vamos gerar um erro de propósito para testar isso.
Lembram-se que Ruby tem uma tipagem forte, onde não podemos misturar os tipos de obje-
tos? Vamos tentar misturar:

```
begin

numero = 1
string = "oi"
numero + string
rescue StandardError => exception
puts "Ocorreu um erro: #{exception}"

end

```

* rodando o programa temos:
```
$ ruby exc.rb
Ocorreu um erro: String can’t be coerced into Integer

```

* O programa gerou uma exceção no código contido entre begin e rescue interceptando o tipo
de erro tratado pela exceção do tipo StandardError, em um objeto que foi transmitido para
rescue, através da variável exception, onde pudemos verificar informações sobre o erro,
imprimindo-o como uma String.
Se não quisermos especificar o tipo de exceção a ser tratada, podemos omitir o tipo, e verifi-
car a classe da exceção gerada dessa maneira:

```
begin
numero = 1
string = "oi"
numero + string
rescue => exception
puts "Ocorreu um erro do tipo #{exception.class}: #{exception}"
end

```