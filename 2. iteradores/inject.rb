=begin
Podemos acumular os elementos com inject, onde vão ser passados um valor acumulador e
o valor corrente pego do iterador. Se desejarmos saber qual é a soma de todos os valores da
nossa Range:

=end

puts "Acumulando elementos:"
puts (0..10).inject {|soma, valor| soma + valor}

puts "Agora com um valor inicial"
puts (0..10).inject(100) {|soma, valor| soma + valor}

puts "No método inject, são enviados dois argumentos, o acumulador (no caso, soma) e logo
após o valor corrente da coleção (no caso, valor."

# E também podemos passar o método que desejamos utilizar para combinação como um símbolo:

puts (0..10).inject(:+)

puts (0..10).inject(100, :+)

puts "Os métodos inject e reduce são indicados para quando precisamos reduzir a coleção em um
valor simples, como Strings e números. Quando precisamos de algo mais complexo, podemos
utilizar each_with_object :"