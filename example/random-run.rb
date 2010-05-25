$: << "lib"

require "many-headed"

i = ManyHeaded.hydra(3){ puts "All done now. Bye bye" }
 
puts "starting #{i}"

3.times{
  sleep(rand(3) * 2)
  puts "hello from #{i}"
}

failed = rand(2) > 0

if failed 
  puts "Oh noes, #{i} failed"
  exit 1
else 
  puts "#{i} completed successfully"
  exit 0
end
