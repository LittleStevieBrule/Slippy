require 'Slippy/version'
require 'Slippy/config_object'
require 'Slippy/run.rb'
require 'Slippy/analysis'

require 'pry'
require 'timeout'

# TODO ITEMS BELOW:
# Unit tests need to written for all the files in Slippy
# Need to document all of these methods

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
