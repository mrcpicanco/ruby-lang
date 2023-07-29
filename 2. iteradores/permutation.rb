a = %w[john paul george ringo]
puts  a.permutation(2)
puts a.permutation(2).to_a
puts  a.permutation(2) { |comb| puts "combinando #{comb[0]} com #{comb[1]}" }