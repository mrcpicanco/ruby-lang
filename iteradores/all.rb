#detectando condição em todos os elementos
# verificar se todos os elementos da coleção atendem uma determinada condição com o método all
puts (0..10).all? {|valor| valor > 1}

puts "segunda verificação"
puts (0..10).all? {|valor| valor < 0}
