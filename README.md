ARGV
========

Extension for ARGV obj.
With this extension module, you can parse in an easy way the script input tags

### example

```ruby

    require 'argv'

    #> $ script.rb --test this --hello world --sup

    puts ARGV.flag_tags
    # {"--test"=>"this", "--hello"=>"world"}

    puts ARGV.flags.inspect
    # ["--test", "--hello", "--sup"]

```

```ruby


    #> $ script.rb  --test this --hello world --su-p asd sdsd -asd -dsa

    puts ARGV.values.inspect
    #> ["this", "world", "asd", "sdsd"]

    puts ARGV.flagtags sym_key: true
    #> {:test=>"this", :hello=>"world", :"su-p"=>"asd"}


```

```ruby


    #> $ script.rb  --test this this multi value --hello world asdf

    puts ARGV.values.inspect
    #> ["this", "world", "asd", "sdsd"]

    puts ARGV.flagtags sym_key: true
    #> {:test=>"this", :hello=>"world", :"su-p"=>"asd"}


```

### multi value use case

```ruby

    #> $ script.rb --test this --hello world --su-p asd sdsd -asd -dsa

    puts ARGV.flag_multi_value.inspect
    #> {"--test"=>["this"], "--hello"=>["world"], "--su-p"=>["asd", "sdsd"]}

```