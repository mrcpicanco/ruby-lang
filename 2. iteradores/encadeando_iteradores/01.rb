puts "Podemos encadear um iterador direto com outro. Digamos que queremos selecionar os números
pares entre 0 e 10 e multiplicar cada um por 2. Podemos utilizar:"

puts (0..10).select { |num| num.even? }