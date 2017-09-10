require 'spec_helper'

RSpec.describe Slippy do

  it 'has a version number' do
    expect(Slippy::VERSION).not_to be nil
  end

  describe '.config' do

    before :all do
      @config = Slippy.config
    end

    it 'respond to timeout' do
      expect(@config.respond_to?(:timeout)).to eq true
    end

    it 'should raise a NoMethodError error'do
      begin
        result = @config.not_defined
      rescue NoMethodError => e
        result = e.name
      end
      expect(result).to eq :not_defined
    end

    it 'should create methods' do
      @config.my_new_property = 'hello world'
      expect(@config.my_new_property).to eq 'hello world'
    end

  end

  describe '.run' do

    it 'should return class Run' do
      expect(Slippy.run(:test).class).to eq Run
    end

    it 'should handle recursion' do
      run = Slippy.run(:fib) do |run|

        run.add_algorithm(:rec) do |n|
          n < 3 ? 1 : rec(n - 1) + rec(n - 2)
        end

        run.add_algorithm(:memo) do |n|
          memo = [0, 1]
          (n - 1).times do
            new = memo[0] + memo[1]
            memo[0] = memo[1]
            memo[1] = new
          end
          memo[1]
        end

        run.add_algorithm(:memo_rec) do |n, memo = [0, 1]|
          memo[n] ? memo[n] : memo_rec(n - 1, memo) + memo_rec(n - 2, memo)
        end

        run.add_data_set(*(5..15).step(5).to_a)

      end
      run.go

    end

  end
end
