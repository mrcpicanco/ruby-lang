=begin
Um método muito útil para coleções é o método grep (mesmo nome do utilitário de linha de
comando - muito útil, por sinal). Podemos, por exemplo, encontrar determinadas Strings em
um Array, no exemplo abaixo, todas as que tem comprimento entre 3 e 7 caracteres:
=end

puts %w[marco aurelio].grep(/\A\w{3,7}\z/)

puts "Selecionar todos os elementos iguais ao informado"

puts [1, 0, 1, 1, 0].grep(0)

puts "Encontrando os objetos de uma determinada classe ou módulo:"

puts [1, "String", 1.23, :aqui].grep(Numeric)

puts "Selecionar os valores de uma determinada faixa, no exemplo abaixo, criando um Array com 10
elementos preenchidos por números de até 10, selecionando somente os únicos que estão entre
5 e 10:"

puts Array.new(10) { rand(10) }.grep(5..10).uniq

puts "Utilizando uma lambda para selecionar determinada condição (no exemplo, as Strings cujo
comprimento é maior que 3):"

puts lamb = ->(str) { str.length > 3 }

puts "Sorteio de números:"

puts (1..60).to_a.shuffle.take(6)

puts (1..60).to_a.shuffle.take(6)

puts (1..60).to_a.shuffle.take(6)