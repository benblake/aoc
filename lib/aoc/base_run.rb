module Aoc
  class BaseRun
    attr_reader :input
    
    def initialize(input_file:)
      raw_input = File.readlines(input_file, chomp: true)
      @input = parse_input(input: raw_input)
    end

    def parse_input(input:)
      input
    end
  end
end
