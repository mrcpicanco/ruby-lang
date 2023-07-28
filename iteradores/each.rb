 [1, 2, 3, 4, 5].each { |e| puts "O array contém o número #{e}"}

 puts "Usando Range"

 (1..5).each { |e| puts "A range contem o numero #{e}"}

 puts "Usando o Times"

 5.times {|e| puts "numero #{e}"}

 puts "Uma lista de 1 até 21, em intervalos de 2"

 (1..21).step(2).each {|e| puts "numero #{e}"}