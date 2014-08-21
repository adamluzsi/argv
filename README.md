ARGV
========

Extension for ARGV obj.
With this extension module, you can parse in an easy way the script input tags

### example

```ruby

    require 'argv'

    #$ ruby sample/test.rb -x -zsa yo --test test this ok

        ARGV.to_hash
        #> {"test"=>"test","zsa"=>"yo"}

        ARGV.to_hash(multi_value: true)
        ARGV.to_hash(true)
        #> {"test"=>["test", "this", "ok"],"zsa"=>["yo"]}

        ARGV.values
        #> ["test", "this", "ok", "yo"]

        ARGV.long_options
        #> ["test"]

        ARGV.short_options
        #> ["x","z","s","a"]

        ARGV.options
        #> ["x","z","s","a","test"]

    #$ ruby sample/test.rb -hy -sx as --hello-world test test2

        ARGV.to_hash
        #> {["s", "x"]=>"as", "hello-world"=>"test"}

        ARGV.to_hash(true)
        #> {["s", "x"]=>["as"], "hello-world"=>["test", "test2"]}

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
