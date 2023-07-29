![Logo](https://upload.wikimedia.org/wikipedia/commons/7/73/Ruby_logo.svg)

# Atenção: 
## Esse resumo foi baseado no livro conhecendo Ruby: aprenda de forma prática e divertida do Eustáquio Rangel

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

### Expressões Regulares
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
* Saída do programa

```
$ ruby exc2.rb
Ocorreu um erro do tipo TypeError: String can’t be coerced into Integer

```
* Podemos utilizar _ensure_ como um bloco para ser executado depois de todos os _rescues_:

```
begin
numero = 1
string = "oi"
numero + string
rescue => exception
puts "Ocorreu um erro do tipo #{exception.class}: #{exception}"
ensure
puts "Lascou tudo."
end
puts "Fim de programa."

```
* Saída do programa

```
$ ruby exc3.rb
Ocorreu um erro do tipo TypeError: String can’t be coerced into Integer
Lascou tudo.
Fim de programa.

```

### Utilizando catch e throw
* Também podemos utilizar catch e throw para terminar o processamento quando nada mais é
necessário, indicando através de um Symbol para onde o controle do código deve ser transferido
(opcionalmente com um valor), indicado com catch, usando throw:

```
def get_input
puts "Digite algo (número termina):"
resp = gets
throw :end_of_response, resp if resp.chomp.match? /^\d+$/
resp
end

num = catch(:end_of_response) do
while true
get_input
end
end
puts "Terminado com: #{num}"

```

* Rodando o programa
```
$ ruby catchthrow.rb
Digite algo (número termina):
oi
Digite algo (número termina):
123
Terminado com: 123

```

## Estruturas de controle
### Condicionais
## IF 
* É importante notar que tudo em Ruby acaba no fim – end – e vamos ver isso acontecendo bastante com nossas estruturas de controle. Vamos começar vendo nosso velho amigo if:

```
i = 10
if i == 10
puts "i igual 10"
else
puts "i diferente de 10"
end

```
* Também temos mais um nível de teste no if, o _elsif_:

```
i = 10
if i > 10
puts "maior que 10"
elsif i == 10
puts "igual a 10"
else
puts "menor que 10"
end

```

* Podemos capturar a saída do teste diretamente apontando para uma variável para ele:
```
i = 10
result =
if i > 10
"maior que 10"
elsif i == 10
"igual a 10"
else
"menor que 10"
end
result

```

## UNLESS
* O unless é a forma negativa do if, e como qualquer teste negativo, pode trazer alguma con-
fusão no jeito de pensar sobre eles. Particularmente gosto de evitar testes negativos quando
pode-se fazer um bom teste positivo.

## CASE
* Podemos fazer o case fazer umas comparações interessantes; Vamos ver como testar com _Ranges_:
```
i = 10
case i
when 0..5
puts "entre 0 e 5"
when 6..10
puts "entre 6 e 10"
else
puts "hein?"
end

```

## SPLAT
* Convém dedicarmos um tempo para explicar um operador bem útil em Ruby, que é o operador
splat (asterisco, *)
Quando usamos o splat na frente do nome de uma variável que se comporta como uma cole-
ção, ele "explode"os seus valores, retornando os elementos individuais:

```
> array = %w(um dois tres)
=> ["um", "dois", "tres"]
> p *array
=> "um"
=> "dois"
=> "tres"
=> nil
> hash = { :um => 1, :dois => 2, :tres => 3 }
=> { :um => 1, :dois => 2, :tres => 3 }
> p *hash
=> [:tres, 3]
=> [:um, 1]
=> [:dois, 2]
=> nil

```
* E quando utilizamos antes de um nome de uma variável, ele "suga"os valores excedentes, agindo
como um "buraco negro". Testando com uma atribuição simples:

```
> array = [1, 2, 3, 4]
=> [1, 2, 3, 4]
> a, b, *c = *array
=> [1, 2, 3, 4]
> a
=> 1
> b
=> 2
> c
=> [3, 4]

```

## Pattern Matching
* O recurso de pattern matching foi apresentado por Kazuki Tsujimoto na RubyKaigi 2019, onde
foi utilizada uma definição de "Learn You a Haskell for Great Good!", de Miran Lipovaca:
```
"A correspondência de padrões (pattern matching consiste em especificar pa-
drões aos quais alguns dados devem estar em conformidade e em seguida, veri-
ficar se isso ocorre e desconstruir os dados de acordo com esses padrões."

```

* Vamos ver um exemplo utilizando o exemplo de atribuição com o operador splat como visto
acima. Podemos utilizar uma sintaxe recente para fazer esse tipo de operação, que é a one line
pattern matching:

```
> [1, 2, 3, 4] => [a, b, *c]
=> nil
> a
=> 1
> b
=> 2
> c
=> [3, 4]

```
* Esse tipo de operação pode ser chamada de desestruturação. Isso é útil para operações
com o splat, como por exemplo, tentando utilizar uma Hash no lado direito do splat:
```
> hash = { a: 1, b: 2, c: 3, d: 4 }
=> {:a=>1, :b=>2, :c=>3, :d=>4}
a, b, *c = *hash
=> [[:a, 1], [:b, 2], [:c, 3], [:d, 4]]
> a
=> [:a, 1]
> b
=> [:b, 2]
3> c
=> [[:c, 3], [:d, 4]]

```
* Nesse caso, cada variável ficou com um par de chave e valor da Hash. Utilizando o one-line
pattern matching, podemos fazer:
```
> hash => { a:, b:, **c }
=> nil
> a
=> 1
> b
=> 2
> c
=> {:c=>3, :d=>4}

```
* Vejam que foram criadas variáveis cujos nomes são as chaves da Hash utilizada do lado direito
do pattern matching. Importante notar que as chaves tem que "casar"com o que foi definido
do lado direito, senão vamos ter um erro de matching:

```
> hash => { a:, b:, e:}
key not found: :e (NoMatchingPatternError)

```
* Vamos utilizar o nosso amigo case para algo como:
```
valores = [1, 2, 3]
case valores
in [a]
puts "O valor é #{a}"
in [a, b]
puts "Os valores são: #{a} e #{b}"
in [a, b, c]
puts "Os valores são: #{a}, #{b} e #{c}"
end

```

* Saída do Programa
```
Os valores são: 1, 2 e 3

```
* Reparem no primeiro case que temos 3 elementos Array, que combinou com o in que tem as
três variáveis a, b e c.
Reparem que conseguimos além de fazer o "encaixe", também identificar valores dentro do
Array:

```
traducoes = [:br, 'Bom dia', :en, 'Good morning']
case traducoes
in [:br, texto_br, :es, texto_es]
puts "'#{texto_br}' em Espanhol é '#{texto_es}'"
in [:br, texto_br, :en, texto_en]
puts "'#{texto_br}' em Inglês é '#{texto_en}'"
else
puts "Sem tradução"
end

```

* Rodando o programa

```
’Bom dia’ em Inglês é ’Good morning’

```
## LOOPS
* Antes de vermos os loops, vamos deixar anotado que temos algumas maneiras de interagir
dentro de um loop:
1. break - sai do loop
2. next - vai para a próxima iteração
3. return - sai do loop e do método onde o loop está contido
4. redo - repete o loop do início, sem reavaliar a condição ou pegar o próximo elemento

## Comentários Mágicos
* Aqui fica uma dica de que podemos utilizar um "comentário mágico", que já vimos anteriormente,
para policiar os nossos arquivos de código fonte. Ruby vai ler o seu código independente do
bom alinhamento do código (não força igual Python), mas vamos ser legais e lembrar que tem
pessoas lendo o seu código, além de computadores executando, beleza? Isso faz parte de uma
filosofia/metodologia de Clean Code, que eu recomendo fortemente. Vamos ver um exemplo de
código desalinhado que funciona:
```
v = 1
if v == 1
puts 'Valor é igual a 1!'
end

```
* Saída do código:
```
Valor é igual a 1!

```
* Agora vamos inserir o comentário mágico _warn_indent: true_ e testar novamente:
```
# warn_indent: true
v = 1
if v == 1
puts 'Valor é igual a 1!'
end

```
* Saída do código:
```
not_aligned_working_warning.rb:6: warning: mismatched indentations at ’end’
Valor é igual a 1!

```
# Atenção

```
Pudemos ver que recebemos um alerta sobre a indentação estar incorreta. Alguns outros co-
mentários mágicos que temos:
• # encoding: utf-8: encoding define o encoding do arquivo corrente para o especificado.
No exemplo, foi especificado utf-8.
• # frozen_string_literal: true: mostrado anteriormente, especifica que as Strings são
todas congeladas, ou seja, não podem ser alteradas.
• # typed: false: habilita ou não a checagem de tipos, nesse caso, desabilitando com false.
A checagem de tipos pode ser feita utilizando ferramentas como Sorbet, Steep, TypeProf,
etc.

```

## WHILE
* Faça enquanto:
```
i = 0
while i < 5
puts i
i += 1
end

```
* Saída do código:
```
1
2
3
4

```

## FOR
* O for pode ser utilizado junto com um iterador para capturar todos os seus objetos e enviá-los
para o loop (que nada mais é do que um bloco de código):
```
for i in (0..5)
puts i
end

```
* Saída do código:
```
0
1
2
3
4
5

```
* Vamos aproveitar que é um loop bem simples e utilizar os comandos para interagir mostrados
acima (mesmo que os exemplos pareçam as coisas mais inúteis e sem sentido do mundo - mas
é para efeitos didáticos, gente!), menos o return onde precisaríamos de um método e ainda
não chegamos lá. Vamos testar primeiro o break:

```
for i in (0..5)
break if i == 3
puts i
end

```
* Saída do código:
```
0 
1
2

```
* Agora o next:
```
for i in (0..5)
next if i == 3
puts i
end

```
* Saída do código:
```
0
1
2
4
5
```
* Agora o redo:
```
for i in (0..5)
redo if i == 3
puts i
end
```
* Saída do código:
```
0
1
2
for.rb:2: Interrupt
from for.rb:1:in ‘each’
from for.rb:1

Se não interrompermos com Ctrl+C, esse código vai ficar funcionando para sempre, pois o
redo avaliou o loop novamente mas sem ir para o próximo elemento do iterador.

```
## UNTIL
* Faça até que!
```
i = 0
until i==5
puts i
i += 1
end

```
* Saída do programa
```
0
1
2
3
4

```

### Dica
```
Não temos os operadores ++ e -- em Ruby.
Utilize += e -=.

```

## OPERADORES LÓGICOS
* Temos operadores lógicos em Ruby em duas formas: !, && e || e not, and e or. Eles se
diferenciam pela precedência: os primeiros tem precedência mais alta que os últimos sobre os
operadores de atribuição.

## PROCS e LAMBDAS

* Procs são blocos de código que podem ser associados à uma variável, dessa maneira:
```
> vezes3 = Proc.new { |valor| valor * 3 }
=> #<Proc:0xb7d959c4@(irb):1>
> vezes3.call(3)
=> 9
> vezes3.call(4)
=> 12
> vezes3.call(5)
=> 15

```
* Comportamento similar pode ser alcançado usando lambda:

```
> vezes5 = lambda { |valor| valor * 5 }
=> #<Proc:0xb7d791d4@(irb):5>
> vezes5.call(5)
=> 25
> vezes5.call(6)
=> 30
> vezes5.call(7)
=> 35

```
* A primeira diferença, é a verificação de argumentos. Em lambdas a verificação é feita e gera
uma exceção:
```
> pnew = Proc.new { |x, y| puts x + y }
=> #<Proc:0x8fdaf7c@(irb):7>
> lamb = lambda { |x, y| puts x + y }
=> #<Proc:0x8fd7aac@(irb):8 (lambda)>
> pnew.call(2, 4, 11)
6
=> nil
> lamb.call(2, 4, 11)
ArgumentError: wrong number of arguments (3 for 2)

```
* A segunda diferença é o jeito que elas retornam. O retorno de uma Proc retorna de dentro de
onde ela está, como nesse caso:
```
def testando_proc
p = Proc.new { return "Bum!" }
p.call
"Nunca imprime isso."
end
puts testando_proc

```
* Enquanto que em uma lambda, retorna para onde foi chamada:
```
def testando_lambda
l = lambda { return "Oi!" }
l.call
"Imprima isso."
end
puts testando_lambda

```
* Temos suporte também à sintaxe "stabby proc/lambda", onde podemos utilizar -> indicando que
vamos definir o corpo da lambda, opcionalmente indicando quais são seus parâmetros:
```
> p = ->(x, y) { x* y }
> puts p.call(2,3)
=> 6

```
* E também ao método curry, que decompõe uma lambda em uma série de outras lambdas.
Por exemplo, podemos ter uma lambda que faça multiplicação:
```
> mult = ->(n1, n2) { n1 * n2 }
=> #<Proc:0x8fef1fc@(irb):13 (lambda)>
> mult.(2, 3)
=> 6

```
* Definida, podemos utilizar o método curry no final e ter o seguinte resultado:
```
> mult = ->(n1, n2) { n1 * n2 }.curry
=> #<Proc:0x8ffe4e0 (lambda)>
> mult.(2).(3)
=> 6

```
* Isso pode ser útil quando você deseja criar uma lambda a partir de outra, deixando um dos
parâmetros fixo, como por exemplo:
```
> mult = ->(n1, n2) { n1 * n2 }.curry
=> #<Proc:0x901dd40 (lambda)>
> dobro = mult.(2)
=> #<Proc:0x901c058 (lambda)>
> triplo = mult.(3)
=> #<Proc:0x9026904 (lambda)>
> dobro.(8)
=> 16
> triplo.(9)
=> 27

```

# Atenção:
* Lambdas não mantém estado, são stateless, ou seja, a saída depende quase somente dos
valores dos parâmetros de entrada. Digo quase somente pois elas também podem ser
closures, como vamos ver mais a frente, e também podem depender de estado externo.

## ITERADORES
* Agora que conhecemos os tipos básicos de Ruby, podemos focar nossa atenção em uma ca-
racterística bem interessante deles: muitos, senão todos, tem coleções ou características que
podem ser percorridas por métodos iteradores.
Um iterador percorre uma determinada coleção, que o envia o valor corrente, executando al-
gum determinado procedimento, que em Ruby é enviado como um bloco de código e contém o
módulo (hein?) Enumerable, que dá as funcionalidades de que ele precisa.
Dos métodos mais comuns para percorrer uma coleção, temos each, que significa "cada", e
que pode ser lido "para cada elemento da coleção do meu objeto, execute esse bloco de código",
dessa maneira:

```
> [1, 2, 3, 4, 5].each { |e| puts "o array contém o número #{e}" }
=> o array contém o número 1
=> o array contém o número 2
=> o array contém o número 3
=> o array contém o número 4
=> o array contém o número 5

```
* Ou seja, para cada elemento do Array, foi executado o bloco - atenção aqui - passando o ele-
mento corrente como parâmetro, recebido pelo bloco pela sintaxe |<parâmetro>|. Podemos
ver que as instruções do nosso bloco, que no caso só tem uma linha, foram executadas com o
valor recebido como parâmetro.

* Aqui percebemos uma característica de Ruby como uma linguagem que suporta também o pa-
radigma declarativo, o que nesse caso deixa o código muito mais limpo e enxuto. Se fossemos
utilizar o paradigma imperativo, que Ruby também suporta, seria feito dessa forma:

```
array = [1, 2, 3, 4, 5]
count = 0
while count <= 4
puts "o array contém o número #{array[count]}"
count += 1
end

```

* Também funciona, mas comparado com o jeito declarativo, é mais feio que bater no vendedor de
maçã do amor da pracinha. Como nos prezamos a escrever código bem legal (né?), fica mais
tranquilo optarmos para o declarativo.
Esse mesmo código declarativo pode ser ainda mais otimizado e refatorado para ficar mais de
acordo com a sua finalidade. Não precisamos de um loop de 1 até 5? A maneira mais adequada
seria criar uma Range com esse intervalo e executar nosso iterador nela:

```
> (1..5).each { |e| puts "a range contem o numero #{e}" }
=> range contem o numero 1
=> range contem o numero 2
=> range contem o numero 3
=> range contem o numero 4
=> range contem o numero 5
```

* Inclusive, podemos também utilizar times em um Integer, que se comporta como uma coleção
nesse caso, que começa em 0:

```
5.times { |e| puts "numero #{e}" }
=> numero 0
=> numero 1
=> numero 2
=> numero 3
=> numero 4

```
* Um Array só faria sentido nesse caso se os seus elementos não seguissem uma ordem lógica
que pode ser expressa em um intervalo de uma Range! Quaisquer sequências que podem ser
representadas fazem sentido em usar uma Range. Se por acaso quiséssemos uma lista de
números de 1 até 21, em intervalos de 2, podemos utilizar:

```
> (1..21).step(2).each { |e| puts "numero #{e}" }
=> numero 1
=> numero 3
=> numero 5
=> numero 7
=> numero 9
=> numero 11
=> numero 13
=> numero 15
=> numero 17
=> numero 19
=> numero 21

```
* Em Rails utilizamos bastante a estrutura for <objeto> in <coleção>, da seguinte forma:

```
> col = %w(uma lista de Strings para mostrar o for)
> for str in col
>
puts str
> end
=> uma
=> lista
=> de
=> Strings
=> para
=> mostrar
=> o
=> for

```

## Selecionando elementos

* Vamos supor que queremos selecionar alguns elementos que atendam alguma condição nos
nossos objetos, por exemplo, selecionar apenas os números pares de uma coleção:

```
> (1..10).select { |e| e.even? }
=> [2, 4, 6, 8, 10]

```

* Podemos utilizar ao invés de select, filter, que é apenas um alias que pode ficar mais
confortável para quem está chegando agora vindo de outras linguagens.
* Vamos testar com uma Hash:

```
{ 1 => "um", 2 => "dois", 3 => "tres" }.select { |chave, valor| valor.length > 2 }
=> {2=>"dois", 3=>"tres"}

```

* Temos também o conceito de lazy evaluation. Reparem no método lazy antes do select:

```
natural_numbers = Enumerator.new do |yielder|
number = 1
loop do
yielder.yield number
number += 1
end
end
p natural_numbers.lazy.select { |n| n.odd? }.take(5).to_a
=> [1, 3, 5, 7, 9]

```
* Vamos ver esse tal de yield mais para frente. Por enquanto pensem que ele está passando
aquele número para frente, para o Enumerator criado.

```
Se não utilizássemos lazy, íamos precisar de um CTRL+C, pois o conjunto de números naturais
é infinito, e a seleção nunca pararia para que fossem pegos os 5 elementos.
```

## Selecionando os elementos que não atendem uma condição
* O contrário da operação acima pode ser feito com reject:
```
> (0..10).reject {|valor| valor.even?}
=> [1, 3, 5, 7, 9]

```

* Nada que a condição alterada do select também não faça.
## Processando e alterando os elementos
* Vamos alterar os elementos do objeto com o método map, primeiro transformando no dobro do
valor de cada elemento:
```
> (0..10).map { |valor| valor * 2 }
=> [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

```

```
Aqui podemos ver que temos alguns conceitos matemáticos envolvidos. Essa operação
acima poderia ser descrita como dobrar cada elemento da seleção dos elementos de um
conjunto (que é a Range) que fazem parte dos números naturais representados aqui pelo
símbolo N.
Os números naturais são considerados sendo os números inteiros positivos e utilizamos
aqui o número 1 em sobreescrito para deixar claro que o número 0 não está incluído no
conjunto, agora o definindo como os números inteiros, selecionando os números menores
ou iguais a 10:
S = {2.x|x ∈ N1 , x ≤ 10}
Podemos deixar mais explícito que queremos os inteiros utilizando Z:
S = {2.x|x ∈ Z, x ≤ 10}
Esse tipo de operação é conhecido geralmente em matemática como notação de definição
de conjunto (set builder, set comprehension), e em linguagens de programação como com-
preensão de lista(list comprehension) a , sendo:
• 2.x = função de saída
• x = variável
• Z = conjunto de entrada
• x ≤ 10 = predicado

```

* E agora transformando os elementos com um bloco customizado:

```
> %w(um dois tres quatro cinco seis sete oito nove dez).map { |valor| "numero #{valor}"
}
=> ["numero um", "numero dois", "numero tres", "numero quatro",
%"numero cinco", "numero seis", "numero sete", "numero oito", "numero nove",
%"numero dez"]
> { 1 => "um", 2 => "dois", 3 => "tres" }.map { |chave, valor| "numero #{valor}" }
=> ["numero um", "numero dois", "numero tres"]

```
## Detectando condições em todos os elementos
* Vamos supor que desejamos detectar se todos os elementos da coleção atendem uma determi-
nada condição com o método all?:

```
> (0..10).all? { |valor| valor > 1 }
=> false
> (0..10).all? { |valor| valor > 0 }
=> false

```
## Detectando se algum elemento atende uma condição
* Vamos testar se algum elemento atende uma determinada condição com o método any?:
```
> (0..10).any? { |valor| valor == 3 }
=> true
> (0..10).any? { |valor| valor == 30 }
=> false

```
* Nesse caso específico, poderíamos ter escrito dessa forma também:

```
> (0..10).include?(3)
=> true
> (0..10).include?(30)
=> false

```
* Apesar da facilidade com um teste simples, o método any? é muito prático no caso de procu-
rarmos, por exemplo, um determinado objeto com um determinado valor de retorno em algum de
seus métodos.

## Detectar e retornar o primeiro elemento que atende uma condição

* Se além de detectar quisermos retornar o elemento que atende à uma condição, podemos utilizar
o método detect:

```
> (0..10).detect {|valor| valor > 0 && valor % 4 == 0}
=> 4

```
## Detrectando os valores máximo e mínimo
* Podemos usar max e min para isso:

```
> (0..10).max
=> 10
> (0..10).min
=> 0

```
* É interessante notar que podemos passar um bloco onde serão comparados os valores para
teste através do operador <=> (conhecido por "navinha"):

```
> %w(joao maria antonio).max { |elemento1, elemento2| elemento1.length <=> elemento2.
length }
=> "antonio"
> %w(joao maria antonio).min { |elemento1, elemento2| elemento1.length <=> elemento2.
length }
=> "joao"

```

```
Dica
O operador <=> compara o objeto da esquerda com o objeto da direita e retorna -1 se o
objeto à esquerda for menor, 0 se for igual e 1 se for maior do que o da direita:
1 <=> 2 => -1
1 <=> 1 => 0
1 <=> -1 => 1

```
* Olhem que interessante comparando valores de Hashes:
```
> { joao: 33, maria: 30, antonio: 25 }.max { |elemento1, elemento2| elemento1[1] <=>
elemento2[1] }
=> [:joao, 33]
> { joao: 33, maria: 30, antonio: 25 }.min { |elemento1, elemento2| elemento1[1] <=>
elemento2[1] }
=> [:antonio, 25]

```

## Acumulando os elementos
* Podemos acumular os elementos com inject, onde vão ser passados um valor acumulador e
o valor corrente pego do iterador. Se desejarmos saber qual é a soma de todos os valores da
nossa Range:

```
> (0..10).inject { |soma, valor| soma + valor }
=> 55

```
* Podemos passar também um valor inicial:
```
> (0..10).inject(100) { |soma, valor| soma + valor }
=> 155
```
## Dividir a coleção em dois Arrays obedecendo uma condição

```
> (0..10).partition { |valor| valor.even? }
=> [[0, 2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]

```
* E se tentarmos utilizar o método even? enviando como símbolo, como demonstrado como :+
acima?

```
> (0..10).partition(:even?)
=> ArgumentError (wrong number of arguments (given 1, expected 0))

```

* Ops, ocorreu um erro. A razão é que o método partition espera que seja enviado um bloco de
código e não um método. Para fazer a conversão, podemos utilizar o caracter & antes do símbolo,
o que vai criar um bloco de código que vai ter o teste com o método especificado:

```
> (0..10).partition(&:even?)
=> [[0, 2, 4, 6, 8, 10], [1, 3, 5, 7, 9]]

```
## Percorrendo os elementos com os índices

```
> (0..10).each_with_index { |item, indice| puts "#{item} indice #{indice}" }
=> 0 indice 0
=> 1 indice 1
=> 2 indice 2
=> 3 indice 3
=> 4 indice 4
=> 5 indice 5
=> 6 indice 6
=> 7 indice 7
=> 8 indice 8
=> 9 indice 9
=> 10 indice 10

```
## Ordenando uma coleção
```
> %w[joao maria antonio].sort
=> ["antonio", "joao", "maria"]

```
* Podemos ordenar de acordo com algum critério específico, passando um bloco e usando sort_by:

```
> %w[antonio maria joao].sort_by { |nome| nome.length }
=> ["joao", "maria", "antonio"]

```
## Combinando elementos

```> (1..10).zip((11..20))
=> [[1, 11], [2, 12], [3, 13], [4, 14], [5, 15], [6, 16], [7, 17], [8, 18], [9,
19], [10, 20]]
> (1..10).zip((11..20),(21..30))
=> [[1, 11, 21], [2, 12, 22], [3, 13, 23], [4, 14, 24], [5, 15, 25], [6, 16,
26], [7, 17, 27], [8, 18, 28], [9, 19, 29], [10, 20, 30]]

```

* Também podemos usar combination:
```
> a = %w[john paul george ringo]
=> ["john", "paul", "george", "ringo"]
> a.combination(2)
=> #<Enumerable::Enumerator:0xb7d711a0>
> a.combination(2).to_a
=> [["john", "paul"], ["john", "george"], ["john", "ringo"], ["paul", "george"],
["paul", "ringo"], ["george", "ringo"]]
a.combination(2) { |comb| puts "combinando #{comb[0]} com #{comb[1]}" }
=> combinando john com paul
=> combinando john com george
=> combinando john com ringo
=> combinando paul com george
=> combinando paul com ringo
=> combinando george com ringo


```

* Ou permutation:

```
> a = %w[john paul george ringo]
=> ["john", "paul", "george", "ringo"]
> a.permutation(2)
=> #<Enumerable::Enumerator:0xb7ce41c4>
> a.permutation(2).to_a
=> [["john", "paul"], ["john", "george"], ["john", "ringo"], ["paul", "john"],
["paul", "george"], ["paul", "ringo"], ["george", "john"], ["george", "paul"],
["george", "ringo"], ["ringo", "john"], ["ringo", "paul"], ["ringo", "george"]]
> a.permutation(2) { |comb| puts "combinando #{comb[0]} com #{comb[1]}" }
=> combinando john com paul
=> combinando john com george
=> combinando john com ringo
=> combinando paul com john
=> combinando paul com george
=> combinando paul com ringo
=> combinando george com john
=> combinando george com paul
=> combinando george com ringo
=> combinando ringo com john
=> combinando ringo com paul
=> combinando ringo com george
```
* Ou product:
```
> beatles = %w[john paul george ringo]
=> ["john", "paul", "george", "ringo"]
> stooges = %w[moe larry curly shemp]
=> ["moe", "larry", "curly", "shemp"]
beatles.product(stooges)
=> [["john", "moe"], ["john", "larry"], ["john", "curly"], ["john", "shemp"],
["paul", "moe"], ["paul", "larry"], ["paul", "curly"], ["paul", "shemp"],
["george", "moe"], ["george", "larry"], ["george", "curly"], ["george",
"shemp"], ["ringo", "moe"], ["ringo", "larry"], ["ringo", "curly"], ["ringo",
"shemp"]]

```

## Percorrendo valores para cima e para baixo
```
> 1.upto(5) { |num| print num, " " }
=> 1 2 3 4 5
=> 1

> 5.downto(1) { |num| print num, " " }
=> 5 4 3 2 1
=> 5

> 1.step(10,2) { |num| print num, " " }
=> 1 3 5 7 9
=> 1
```
## Filtrando com o grep

* Um método muito útil para coleções é o método grep (mesmo nome do utilitário de linha de
comando - muito útil, por sinal). Podemos, por exemplo, encontrar determinadas Strings em
um Array, no exemplo abaixo, todas as que tem comprimento entre 3 e 7 caracteres:

```
> %w[eustaquio rangel].grep(/\A\w{3,7}\z/)
=> ["rangel"]

> [1, 0, 1, 1, 0].grep(0)
=> [0, 0]

> [1, "String", 1.23, :aqui].grep(Numeric)
=> [1, 1.23]

> Array.new(10) { rand(10) }.grep(5..10).uniq
=> [7, 5]

```

## Encadeamento de iteradores

* Podemos encadear um iterador direto com outro. Digamos que queremos selecionar os números
pares entre 0 e 10 e multiplicar cada um por 2. Podemos utilizar:

```
> (0..10).select { |num| num.even? }
.map { |num| num * 2 }
=> [0, 4, 8, 12, 16, 20]
```

# Métodos
* Podemos definir métodos facilmente em Ruby, usando def, terminando (como sempre) com
end:
```
def diga_oi
puts "Oi!"
end
diga_oi
=> "Oi!"

```

## Dica
```
Podemos definir métodos curtos com a sintaxe de definição de endless methods, como
nesse caso em que reescrevemos o método acima:
def diga_oi = puts("oi")

```
## Retornando valores
* Podemos retornar valores de métodos com ou sem o uso de return. Quando não utilizamos
return, o que ocorre é que a última expressão avaliada é retornada, como no exemplo:

```
def vezes(p1, p2)
p1 * p2
end
puts vezes(2, 3)
=> 6

Dica
Reescrevendo o método acima como endless method:
def vezes(p1, p2) = p1 * p2

```

## Método que retorna cinco múltiplos de um determinado número:

```
def cinco_multiplos(numero)
(1..5).map { |valor| valor * numero }
end
v1, v2, v3, v4, v5 = cinco_multiplos(5)
puts "#{v1}, #{v2}, #{v3}, #{v4}, #{v5}"
=> 5, 10, 15, 20, 25
```

## Enviando valores

```
Antes de mais nada, fica a discussão sobre a convenção sobre o que são parâmetros e o que
são argumentos, convencionando-se à:
Parâmetros são as variáveis situadas na assinatura de um método; Argumentos são os
valores atribuídos aos parâmetros
```
* Vimos acima um exemplo simples de passagem de valores para um método, vamos ver outro
agora:

```
def vezes(n1, n2)
n1 * n2
end
puts vezes(3, 4)
=> 12

```

## Métodos podem receber parâmetros _default_, como por exemplo:

```
def oi(nome = "Forasteiro")
puts "Oi, #{nome}!"
end
oi("TaQ")
=> Oi, TaQ!
oi
=> Oi, Forasteiro!
```

## Podemos fazer uso dos argumentos nomeados (keyword arguments), indicando que o método
vai receber os seus valores identificados :
```
def mostra(a:, b:)
puts "a é igual #{a}, b é igual #{b}"
end
mostra(a: 1, b: 2)
=> a é igual 1, b é igual 2
mostra(b: 2, a: 1)
=> a é igual 1, b é igual 2

```
* Do modo definido acima, ambos os argumentos são obrigatórios:
```
mostra(b: 2)
ArgumentError: missing keyword: a
from (irb):1:in `mostra'

```
* Podemos também especificar valores default para eles:
```
def mostra(a: 1, b: 2)
puts "a é igual #{a}, b é igual #{b}"
end

mostra(b: 2)
=> a é igual 1, b é igual 2

```
* E também misturar com os argumentos tradicionais:

```
def mostra(a, b: 2)
puts "a é igual #{a}, b é igual #{b}"
end
mostra(1, b: 2)
=> a é igual 1, b é igual 2

```
* Importante notar que a definição do método retorna um símbolo com o nome do método, o que
nos permite chamar ele mais tarde direto por essa referência:

```
met = def mostra(a, b: 2)
puts "a é igual #{a}, b é igual #{b}"
end
send(met, 1, b: 10)
=> a é igual 1, b é igual 10

```

## Enviar e processar blocos e procs
* Como vimos com iteradores, podemos passar um bloco para um método, e para o executarmos
dentro do método, usamos yield:
```
def executa_bloco(valor)
yield(valor)
end
executa_bloco(2) { |valor| puts valor * valor }
=> 4
executa_bloco(3) { |valor| puts valor * valor }
=> 9
executa_bloco(4) { |valor| puts valor * valor }
=> 16

```
* O método yield irá acionar o bloco enviado como argumento, passando no caso acima o argu-
mento de valor para o bloco.
Meio que primo do yield, temos o yield_self, que pega o próprio valor, executa o bloco
enviado e retorna o último retorno do bloco:

 ```
 > 1.yield_self { |num| num + 1 }
=> 2

 ```

 * Vamos pegar esse exemplo onde temos
uma lambda para duplicar e outra para exponenciar um valor ao quadrado, onde se invertermos
a ordem o valor ficará diferente. Queremos que o resultado final seja 16, duplicando e depois
exponenciando o número 2. Se invertermos a ordem dos métodos, o resultado será 8. Vamos
utilizar o yield_self para executar na ordem desejada no segundo caso:
```
> duplicar = -> (val) { val * 2 }
=> #<Proc:0x000056358a8f1400 (irb):29 (lambda)>
> quadrado = -> (val) { val ** 2 }
=> #<Proc:0x000056358a932ef0 (irb):30 (lambda)>
> duplicar(2)
=> 4
> quadrado(duplicar(2))
=> 16
> 2.yield_self(&duplicar).yield_self(&quadrado)
=> 16


> 2.then(&duplicar).then(&quadrado)
=> 16

> 2.then { |num| num * 2 }.then { |num| num ** 2 }
=> 16

O que nos evitaria código como:
> v = 2
=> 2
> v = v * 2
=> 4
> v = v ** 2
=> 16

```

```
Dica
Podemos utilizar pow ou o operador ** para retornar o número exponenciado:
> 2.pow 2
=> 4
> 2.pow 3
=> 8
> 2 ** 2
=> 4
> 2 ** 3
=> 8

```

## Valores são transmitidos por transferência
* Como recebemos referências do objeto nos métodos, quaisquer alterações que fizermos dentro
do método refletirão fora, como já vimos um pouco acima quando falando sobre variáveis. Vamos
comprovar:
```
def altera!(valor)
valor.upcase!
end

string = "Oi, mundo!"
altera!(string)
puts string
=> "OI, MUNDO!"

Lembrando que se estivermos utilizando objetos congelados, isso não vai funcionar! Os mé-
todos que tem comportamento destrutivo, como explicado daqui a pouco, que alteram o objeto
que foi passado como argumento, devem obedecer à convenção de utilizar um ponto de excla-
mação (!) nos seus nomes e devemos prestar atenção tanto em não enviar objetos congelados
para eles como nos seus efeitos colaterais (side effects) ao enviar objetos que podem ser mo-
dificados e depois apresentar algumas "surpresinhas"não esperadas no decorrer da execução
do código. Na verdade, qualquer tipo de objeto que possa retornar alterado de dentro de um
método pode gerar essas "surpresinhas"e efeitos colaterais, então usem os métodos destrutivos
de modo estritamente necessário.

```

## Interceptando exceções direto no método

```
def soma(valor1, valor2)
valor1 + valor2
rescue
nil
end
puts soma(1, 2)
=> 3
puts soma(1, :um)
=> nil

```

* Também podemos utilizar o rescue direto em um modificador de estrutura:

```
value = soma(1, nil) rescue nil
=> nil

Vale aqui lembrar que temos uma diferença de performance utilizando rescue dessa maneira,
onde podemos utilizar o operador ternário:

require 'benchmark'

```