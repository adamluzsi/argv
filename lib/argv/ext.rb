module ARGVEXT

  module EXTENSION

    def to_hash(opts={})

      multi_value = if opts.class <= Hash
                      opt_keys    = %W[ multi_value mv m ]
                      !!(opts.find{ |k,v| opt_keys.include?(k.to_s) })
                    else
                      !!opts
                    end

      return (0..self.size).reduce({}) do |return_obj,index|

        if !self[index+1].nil? && self[index][0] =~ /^--?/ && !(self[index+1][0] =~ /^--?/)

          begin

            option_key = if self[index] =~ /^--\w+/
                           self[index].sub(/^--/,'')
                         else #if self[index] =~ /^-\w+/
                           if (var = self[index].sub(/^-/,'').split('')).size == 1
                             var[0]
                           else
                             var
                           end
                         end

            return_obj[option_key] = if multi_value
                             new_element= []
                             index_at= index+1
                             loop do
                               if self[index_at].nil? || self[index_at].to_s[0].include?('-')
                                 break
                               else
                                 new_element.push(self[index_at])
                               end
                               index_at += 1
                             end
                             new_element
                           else
                             # return_obj[self[index].sub(/^--?/,'')]=
                             self[index+1]
                           end

          rescue
          end

        end

        #> for persist in memory the temp memory object
        (return_obj)

      end

    end

    # Mandatory arguments to long options are mandatory for short options too.
    def short_options
      self.select{ |e| e =~ /^-\w+$/ }.reduce([]){|m,o| o.scan(/\w+/).each{|e| m += e.split('') } ;m}
    end;alias short_option_flags short_options

    def long_options
      self.select{ |e| e =~ /^--.*$/ }.reduce([]){|m,o| o.scan(/^--(.*)$/).each{|e| m += e } ;m}
    end;alias long_option_flags  long_options

    def options
      short_options + long_options
    end;alias option_flags options

    def values
      self.select { |e| !(e[0] =~ /^-/) }
    end;alias arguments values

  end
end
ARGV.__send__ :extend,ARGVEXT::EXTENSION

# puts ARGV.respond_to?(:options)
# puts ARGV.options.inspect
# puts ARGV.values.inspect
# puts ARGV.to_hash(true)