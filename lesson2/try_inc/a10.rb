#!/usr/bin/env ruby

class Kaka
  dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }

  dt.("cpA hey")

  class Gaka
    require_relative "lib1"
  end

  dt.("cpA mihey")

  def googoo
    dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }
    dt.("cpB hey")
    dt.("cpB self #{self.inspect} #{self.class}")
  end
  #dt.("cpA res #{res.inspect}")

  dt.("cpA self #{self.inspect} #{self.class}")
end

def do1
  dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }
  dt.("hey")
  dt.("self #{self.inspect} #{self.class}")
end

# def do2
#   Kaka.new.googoo
# end

def do3
  dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }
  dt.("hey")
  dt.("Kaka::Gaka #{Kaka::Gaka.inspect}")
  #dt.("Kaka::Gaka::Maka #{Kaka::Gaka::Maka.inspect}")
  dt.("Gaka #{Gaka.inspect}")
  dt.("Maka #{Maka.inspect}")
end

#--------------------------------------- Main

do3
#do2
#do1
