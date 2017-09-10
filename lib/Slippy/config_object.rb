require 'ostruct'

# Configuration object
# You can define anything on this object
class Config < OpenStruct

  def initialize(hash)
    super hash
    hash.each do |k, v|
      send("#{k}=", v)
    end
  end

  def method_missing(name, *args, &block)
    if /^.*=$/.match? name
      super
    else
      msg = "undefined method `#{name}' for Config"
      raise NoMethodError.new(msg, name)
    end
  end

  def respond_to_missing?(mid, include_private = false)
    @table.key?(mid.to_s.chomp('=').to_sym) || super
  end
end