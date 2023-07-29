# Detectar e retornar o primeiro elemento que atende uma condição
# Se além de detectar quisermos retoanr o elemento quea tende a uma condição?

puts (0..10).detect {|valor| valor > 0 && valor % 4 == 0}