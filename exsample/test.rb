require "argv"

#$ ruby sample/test.rb --test test this ok

# new help
ARGV.add_help "nothing really but just a option",*%W[ o option options]
ARGV.show_help#(false)

puts "","original ARGV:",ARGV.inspect,""

puts "hash from argv:",ARGV.to_hash,""
# {"test"=>"test"}

puts "multi valued hash:",ARGV.to_hash( multi_value: true ),""
# {"test"=>["test", "this", "ok"]}

puts "argv values without the tags:",ARGV.values.inspect,""
# ["test", "this", "ok"]

puts "argv tags, \"options\":",ARGV.options.inspect,""
# ["test"]