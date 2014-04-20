module ARGVEXT



end

# Object.__send__ :include, Configer::ObjectEXT


ARGV.instance_eval do

  def flag_tags

    return_obj= {}
    self.count.times do |index|

      begin

        if self[index][0].include?('-') && !self[index+1][0].include?('-')
          return_obj[self[index]]= return_obj[self[index+1]]
        end

      rescue

      end

    end
    return return_obj

  end
  alias :flag_tag :flag_tags
  alias :flagtag  :flag_tags
  alias :flagtags :flag_tags

  def flags
    self.select{ |e| e[0].include?('-') }
  end


end

puts ARGV.flag_tags