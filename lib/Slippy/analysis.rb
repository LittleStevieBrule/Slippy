require 'timeout'

module Slippy
  # analysis method are located here
  module Analysis

    def timer(timeout = Slippy.config.timeout)
      start = Time.now
      begin
        Timeout.timeout(timeout) do
          yield if block_given?
        end
      rescue Timeout::Error
        puts "#{timeout} second timeout reached"
        return "> #{timeout}"
      end
      Time.now - start
    end

    def result
      @result ||= Results.new
    end

    # results class
    class Results

      def initialize
        @results = {}
      end

      def []=(key,value)
        @results[key] = value
      end

      def [](key)
        @results[key]
      end

      def report
        result = @results.keys.map do |key|
          "#{self.class}:#{key}:#{@results[key]}"
        end
        result.each do |e|
          puts e
        end
      end

    end

  end
end