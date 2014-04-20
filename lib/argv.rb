module ARGVEXT

  def flag_tags opts= {}
    raise(ArgumentError) unless opts.class <= Hash

    opts[:sym_key] ||= opts[:sym] || opts[:sk] || opts[:s]

    return_obj= {}
    self.count.times do |index|

      next if self[index+1].nil?
      if self[index][0].include?('-') && !self[index+1][0].include?('-')
        return_obj[( opts[:sym_key] ?  self[index].dup.to_s.gsub!(/^-*/,'').to_sym :  self[index] )]= self[index+1]
      end

    end
    return return_obj

  end
  alias :flag_value :flag_tags
  alias :flag_tag   :flag_tags
  alias :flagtag    :flag_tags
  alias :flagtags   :flag_tags

  def flag_multi_value opts= {}
    raise(ArgumentError) unless opts.class <= Hash

    opts[:sym_key] ||= opts[:sym] || opts[:sk] || opts[:s]


    return_obj= {}
    self.count.times do |index|

      begin

        if self[index][0].include?('-') && !self[index+1][0].include?('-')

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
          return_obj[( opts[:sym_key] ?  self[index].dup.to_s.gsub!(/^-*/,'').to_sym :  self[index] )]= new_element

        end

      rescue
      end

    end
    return return_obj

  end

  def flags
    self.select { |e| e[0].include?('-') }
  end

  def values
    self.select { |e| !e[0].include?('-') }
  end

end

ARGV.__send__ :extend,ARGVEXT