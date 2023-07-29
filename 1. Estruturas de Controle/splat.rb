=begin
Quando usamos o splat na frente do nome de uma variável que se comporta como uma cole-
ção, ele "explode"os seus valores, retornando os elementos individuais:

=end

array = %w( um dois tres)
puts array

p *array

