#  Detectando o máximo e o mínimo
puts "Detectar o máximo"
puts (0..10).max

puts "Detectar o mínimo"
puts (0..10).min

puts %w(joao maria antonio).max { |elemento1, elemento2| elemento1.length <=> elemento2.length }

=begin
O operador <=> compara o objeto da esquerda com o objeto da direita e retorna -1 se o
objeto à esquerda for menor, 0 se for igual e 1 se for maior do que o da direita:

1 <=> 2 => -1
1 <=> 1 => 0
1 <=> -1 => 1

=end