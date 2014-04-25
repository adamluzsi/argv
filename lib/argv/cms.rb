module ARGVEXT
  class << self

    @@help_msg_obj ||= []
    def add_help_msg msg,*keys
      raise unless msg.class <= String
      @@help_msg_obj.push [msg,keys]
      return nil
    end

    alias :add_help :add_help_msg

    def help_msg

      helper_sym= [:helper,:help,:h]
      self.add_help_msg "This will show you the help msg (this)",*helper_sym
      unless ::ARGV.sym_flags.select{ |e| helper_sym.include?(e) }.empty?

        tmp_ary= []
        @@help_msg_obj.each{ |ary|
          tmp_ary.push(ary[0])
          ary[1].each{|e| tmp_ary.push( ( e.to_s.length == 1 ? "-#{e}" : "--#{e}" ) )}
          tmp_ary.push("")
        }

        tmp_ary.each{ |element| element.include?('--') ? element.gsub!('--',"\t--") : element.gsub!('-',"\t -")}
        puts "",tmp_ary.join("\n"),""
        Process.exit!

      end
    end

    alias :show_help :help_msg

  end
end