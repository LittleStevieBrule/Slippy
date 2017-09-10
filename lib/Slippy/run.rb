require 'pry'
require_relative 'analysis'

# run class
class Run
  include Slippy::Analysis

  def initialize(name)
    @name = name
    @algorithms = []
    @data = []
    yield self if block_given?
  end

  def add_data_set(*data)
    data.each do |d|
      @data << d
    end
  end

  def add_algorithm(name, &block)
    raise 'cannot redefine method' if self.class.respond_to? name.to_sym
    self.class.send(:define_method, name, &block)
    @algorithms << name.to_sym
  end

  def go
    @data.each do |d|
      @algorithms.each do |alg|
        result[alg] = timer do
          send(alg, d)
        end
      end
    end
    result.report
  end

end