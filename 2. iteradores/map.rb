# Alterar os elementos do objeto (dobro, triplo, dividir)
puts (0..10).map {|valor| valor * 2}

puts "Transformando os elementos com um bloco costumizado"

puts %w( um dois tres quatro cinco seis sete oito nove dez).map {|valor| "numero #{valor}"}