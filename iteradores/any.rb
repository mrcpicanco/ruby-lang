# Verificar se algum elemento atende uma determinada conição com o método any
puts "primeira verificação"
puts (0..10).any? {|valor| valor == 3}

puts "refatorada 1"
puts (0..10).include?(3)

puts "segunda verificação"
puts (0..10).any? {|valor| valor == 30}

