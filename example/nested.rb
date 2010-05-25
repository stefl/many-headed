$: << "#{File.dirname(__FILE__)}/../lib"

require "many-headed"

# You can nest hydra inside eachother with no problem. Repeated calls to hydra will work as expected. 

i = ManyHeaded.hydra(3){ puts "Top level exiting" }

puts "Spawning top level head #{i}"

j = ManyHeaded.hydra(2){ 
  if rand(2) > 0  
    puts "Top level head #{i} failed!" 
    exit 1
  else
    puts "Top level head #{i} exiting" 
  end
}

puts "  this is head #{j} inside of head #{i}"

if rand(2) > 0
  puts "  head #{i}/#{j} failed"
  exit 1 
end
