
class Faculty
  def initialize
    dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }
    dt.("hey")
  end
end
