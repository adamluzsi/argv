require "argv"

ARGV.push('-asd')

puts ARGV.sym_flags(s:true)[:asd].inspect
puts ARGV.to_hash(s:true)[:asd].inspect
puts ARGV.to_hash(s:true)[:asd].nil?

ARGV.push('hmm')

puts ARGV.to_hash(s:true)[:asd].inspect
puts ARGV.to_hash(s:true)[:asd].inspect
puts ARGV.to_hash(s:true)[:asd].nil?
