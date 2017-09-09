require 'Slippy/version'
require 'Slippy/config_object'

require 'pry'

# main module
module Slippy

  def self.config
    defaults = { timeout: 30 }
    @config ||= Config.new(defaults)
  end

end
