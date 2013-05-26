#origional hash
dna_bases = { "A" => "adenine",
  "G" => "guanine",
  "T" => "thynine",
}

#adds to existing hash
dna_bases["C"] = "Cytosine"

#print them for fun.
dna_bases.each { |index, name| puts "#{index}: #{name}"}

#test to ensure there are only 4 DNA bases

base_count = dna_bases.length
if base_count = 4
  puts "true"
else
  puts "false"
end
