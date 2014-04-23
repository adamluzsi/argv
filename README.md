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

    puts ARGV.flag_syms.inspect
    # [:test, :test, :this, :ok]

```

#### For Modules

if you write module and you want to have some custom tags and help msg for that,
use the following example

```ruby

    require 'argv'

    ARGVEXT.add_help_msg "This will show you the help msg (this)",:helper,:help,:h

    #
    # ARGVEXT.help_msg or show_help will read on your values and will produce the following with this example
    #
    #   This will show you the help msg (this)
    #         --helper
    #         --help
    #          -h

    # this will run on the terminal and break Process,
    # if the user give one of the helper tags as argv

```

### Test

* you can find a test file in the sample named as "test"
