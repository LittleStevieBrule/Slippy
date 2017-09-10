
module Slippy
  # analysis method are located here
  module Analysis

    def timer(timeout = 30)
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

  end
end