module ARGVEXT

  module MemoryCore

    def add_help_msg(msg,*keys)
      raise(ArgumentError,'invalid Message, must be String like object') unless msg.class <= String
      raise(ArgumentError,'invalid options given for this message, must be String like') if keys.any?{|e| !(e.class <= String) }
      __helper_msg_obj__.push [msg,keys.sort{|a,b| b.length <=> a.length }]
      return nil
    end;alias add_help add_help_msg

    def init_basic_help_msg
      unless @init_done
        __helper_flags__.push *%W[ helper help h ]
        self.add_help_msg 'This will show you the help msg (this)',*__helper_flags__
        @init_done = true
      end
    end

    #> Basic help message is a boolean input,
    # if false, there will be no basic options made like '-h' '--help'
    def help_msg(basic_help_msg=true)
      init_basic_help_msg if !!basic_help_msg
      unless ::ARGV.options.select{ |e| __helper_flags__.include?(e) }.empty?

        tmp_ary= []
        __helper_msg_obj__.each do |ary|
          tmp_ary.push(ary[0])
          ary[1].each{|e| tmp_ary.push( ( e.to_s.length == 1 ? "-#{e}" : "--#{e}" ) )}
          tmp_ary.push('')
        end

        tmp_ary.each{ |element| element.include?('--') ? element.gsub!('--',"\t--") : element.gsub!('-',"\t -")}
        puts '',tmp_ary.join("\n"),''
        Process.exit!

      end
      return nil
    end;alias show_help help_msg

    protected

    def __helper_msg_obj__
      @help_msg_obj ||= []
    end

    def __helper_flags__
      @helper_flags ||= []
    end

  end

end

ARGV.__send__ :extend, ARGVEXT::MemoryCore