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

    # TODO: this test does not belong here
    it 'should handle recursion' do
      run = Slippy.run(:fib) do |run|

        run.add_algorithm(:rec) do |n|
          n < 3 ? 1 : rec(n - 1) + rec(n - 2)
        end

        run.add_algorithm(:memo_rec) do |n, memo = [0, 1]|
          memo[n] ? memo[n] : memo_rec(n - 1, memo) + memo_rec(n - 2, memo)
        end

        run.add_data_set(*(5..15).step(5).to_a)

      end
      run.go
    end

    # TODO: this test does not belong here
    it 'Should Timeout' do
      Slippy.config.timeout = 30
      run = Slippy.run(:fib) do |run|
        run.add_algorithm(:rec) do |n|
          n < 3 ? 1 : rec(n - 1) + rec(n - 2)
        end
        run.add_data_set(100)
      end
      start = Time.now
      begin
        Timeout.timeout(60) do
          run.go
        end
      rescue Timeout::Error
        raise
      end
      expect((Time.now - start) < 35)
    end

  end
end
