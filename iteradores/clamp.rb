=begin

Um método que utiliza o operador <=> é o método clamp, que tem no seu retorno a garantia
que um determinado valor esteja em uma determinada Range.

=end
puts "Foi tentando encaixar 10 entre 1 e 5, mas como 10 não está na faixa, foi retornado o numero mais próximo"
puts 10.clamp(1,5)

puts "Nesse caso, é perfeitamente encontrar 10 no rantge 5 .. 15. Logo o número retornado é o 10"
puts 10.clamp(5, 15)

puts "Aqui, é retornado o número mais próximo de 10, nesse caso, o menor número"
puts 10.clamp(15, 25)