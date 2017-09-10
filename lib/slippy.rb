require 'Slippy/version'
require 'Slippy/config_object'
require 'Slippy/run.rb'

require 'pry'
require 'timeout'

# main module
module Slippy

  def self.config
    defaults = { timeout: 30 }
    @config ||= Config.new(defaults)
  end

  def self.run(run_name, &block)
    Run.new(run_name, &block)
  end

end
