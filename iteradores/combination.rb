a = %w[ jhon paul george ringo]
puts a.combination(2)

puts a.combination(2).to_a

puts a.combination(2) {|comb| puts "combinado #{comb[0]} com #{comb[1]}" }