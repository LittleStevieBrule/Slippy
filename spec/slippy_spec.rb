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
end
