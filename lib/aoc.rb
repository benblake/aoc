Dir[File.join(__dir__, '**', '*.rb')].each { |file| require file }

module Aoc
  class Error < StandardError; end
  # Your code goes here...
end
