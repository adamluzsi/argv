ARGV
========

Extension for ARGV obj.
With this extension module, you can parse in an easy way the script input tags

### example

```ruby

    require 'argv'

    #$ ruby sample/test.rb --test test this ok

    puts ARGV.to_hash
    # {"--test"=>"test"}

    puts ARGV.to_hash( multi_value: true )
    # {"--test"=>["test", "this", "ok"]}

    puts ARGV.to_hash( sym_key: true )
    # {:test=>"test"}

    puts ARGV.to_hash( s: true, m: true )
    # {:test=>["test", "this", "ok"]}

    puts ARGV.values.inspect
    # ["test", "this", "ok"]

    puts ARGV.keys.inspect
    # ["--test"]

```