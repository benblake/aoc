module Aoc
  module Y2022
    module D4
      class Run < BaseRun
        def parse_input(input:)
          input.map do |line|
            pairs = line.split(",")
            range_1 = pairs[0].split("-").map(&:to_i)
            range_2 = pairs[1].split("-").map(&:to_i)

            {
              pair_1: (range_1[0]..range_1[1]).to_a,
              pair_2: (range_2[0]..range_2[1]).to_a,
            }
          end
        end

        def part_1
          input.map { |pair| full_overlap(pair) ? 1 : 0 }.sum
        end

        def part_2
          input.map { |pair| partial_overlap(pair) ? 1 : 0 }.sum
        end

        def full_overlap(pair)
          return true if (pair[:pair_1] - pair[:pair_2]).empty?
          return true if (pair[:pair_2] - pair[:pair_1]).empty?
          false
        end

        def partial_overlap(pair)
          (pair[:pair_1] & pair[:pair_2]).any?
        end
      end
    end
  end
end
