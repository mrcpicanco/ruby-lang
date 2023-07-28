# Ordenando uma coleção

puts %w[joao maria antonio].sort

=begin
Podemos ordernar de acordo com algum critério específico, passando um bloco e usando o sort_by:
=end
puts "Ordenando com um critério específico."
puts %w[ antonio maria joao].sort_by { |nome| nome.length}