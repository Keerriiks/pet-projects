require_relative "base_tool"

class Student < BaseTool
  AttrMagic.load(self)

  # @return [Symbol] +:female+ или +:male+.
  attr_accessor :gender

  attr_writer :nickname

  def initialize(attrs = {})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # @return [String] <i>(defaults to: +"galNNNN"+, +"palNNNN"+)</i>
  def nickname
    return @nickname if defined? @nickname

    require_attr :gender
    
    @nickname = (gender == :female ? "gal" : "pal") + sprintf("%04d", 1 + Kernel.rand(9999))
  end
end