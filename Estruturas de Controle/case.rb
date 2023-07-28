=begin 
Avalia uma lista de condições e retorna uma das várias expressões de resultado possíveis, a expressão CASE tem dois formatos: 
CASE simples compara uma expressão com um conjunto de expressões simples para determinar o resultado e a expressão CASE
que avalia um conjunto de expressões booleanas para determinar o resultado. 
Ambos os formatos suportam um argumento ELSE opcional.
=end
puts "Verificando em que intervalo o número 10 está."
i = 10

case i 
when 0..5
    puts "entre 0 e 5"
when 0..6
    puts "entre 6 e 10"
when 6..10
    puts "entre 6 e 10"
end
puts "========================================"
puts "Verificando a natureza do objeto"

i = 10
case i
when String
    puts "É uma string"
when Integer
    puts "É um inteiro"
when Boolean
    puts "É um booleano"
end


