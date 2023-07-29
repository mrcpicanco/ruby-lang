=begin
O for pode ser utilizado junto com um iterador para capturar todos os seus objetos e enviá-los
para o loop (que nada mais é do que um bloco de código):
=end

for i in (0..10)
    puts i
end

puts "============ Usando Break"

for i in (0..5)
    break if i == 4
    puts i
end

puts "=============== Usando NEXT"

for i in (0..8)
    next if i == 6
    puts i
end

puts "=========== Usando REDO"

puts "ATENÇÂO: Se não interrompermos com Ctrl+C, esse código vai ficar funcionando para sempre, pois o
redo avaliou o loop novamente mas sem ir para o próximo elemento do iterador."

for i in (0..5)
    redo if i == 3
    puts i
end

