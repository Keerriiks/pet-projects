#!/usr/bin/env ruby

#$LOAD_PATH << File.expand_path("college", __dir__)

# Нам нужен класс факультет.


#require "kaka_makaka"
#KakaMakaka.new
# "kaka_makaka" …


#require "faculty"
#require_relative "college/faculty"

#require "attr_magic"

dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }

dt.("cp 1 $LOAD_PATH #{$LOAD_PATH.inspect}")
require_relative "../classes/base_tool"
dt.("cp 2 $LOAD_PATH #{$LOAD_PATH.inspect}")

def do1
  dt = -> (*args) { pfx = "\e[1;34m#{File.basename(__FILE__)}:#{__LINE__} \e[1;32m#{__method__}():\e[0m "; out = nil; args.each { |v| puts "#{pfx}#{v.is_a?(String) ? v : v.inspect}"; out = v }; out }
  dt.("hey")
  fac = Faculty.new
  dt.("fac #{fac.inspect}")
end

#---------------------------------------

#do1
