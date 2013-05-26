#User Input upcase for readability.
puts "Sense Code?" 
input = gets.chomp.upcase.split(//)
 
#2 copies. One to use as reference later, and the other to use for trascribing commands.
sense = input.to_s
template = input.to_s

#Prep to test input code. Isolates unique letters and alphabetizes them.
input.uniq!
input.sort!
print "#{input} \n" # \n to stack the input array above the dna_base array.

#Prep dna_base array for comparison to input array.
dna_bases = ["T", "C", "G", "A"] 
dna_bases.sort! #might be unnecessary, but prevents potential future errors.
print "#{dna_bases} \n" 

unless input == dna_bases
  puts "Code Error: Check your nucleotides and try again."
else 
  puts "Acceptable replication template."
  
  template.gsub!("A", "1")      # can't do template.gsub!("A","T")
  template.gsub!("C", "2")      # directly with this stepwise procedure
  template.gsub!("G", "3")      # Have to go through a transcription array
  template.gsub!("T", "4")      # to prevent incorrect substitutions.

  anti_sense = template         # This is what drove me crazy.
  anti_sense.gsub!("1", "T")    # Does anyone have an easier way to do this?
  anti_sense.gsub!("2", "G")
  anti_sense.gsub!("3", "C")
  anti_sense.gsub!("4", "A")

  puts "Anti-sense code: #{anti_sense}. \n"
  puts "Sense code     : #{sense}."
end