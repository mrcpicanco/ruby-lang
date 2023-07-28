=begin
Reparem que no caso do nome do método each_with_object ele já entrega a ordem dos
argumentos a serem enviados, que é a inversa de reduce: "cada com objeto", ou seja, o
valor corrente é o primeiro valor enviado e o "acumulador"é o segundo.
=end

puts dobro = (0..10).each_with_object({}) { |valor, hash| hash[valor] = valor * 2 }
#=> {0=>0, 1=>2, 2=>4, 3=>6, 4=>8, 5=>10, 6=>12, 7=>14, 8=>16, 9=>18, 10=>20}

puts "Percorrendo os elementos com os indices:"

puts (0..10).each_with_index { |item, indice| puts "#{item} indice #{indice}" }