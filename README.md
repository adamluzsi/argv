ARGV
========

Extension for ARGV obj.
With this extension module, you can parse in an easy way the script input tags

### example

```ruby

    #> $ script.rb --test this --hello world --sup

    puts ARGV.flag_tags
    # {"--test"=>"this", "--hello"=>"world"}

    puts ARGV.flags.inspect
    # ["--test", "--hello", "--sup"]

```