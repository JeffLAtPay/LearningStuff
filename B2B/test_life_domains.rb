life_domains = ["Bacteria", "Archaea", "Eukarya"]

life_domains.each { |x| puts "#{x}" } 

puts "What is the most recent domain evolve?"
  recent_domain = gets.chomp
  
if 
  recent_domain = life_domains[2].to_s
  puts "True"
else
  puts "False"
end
  