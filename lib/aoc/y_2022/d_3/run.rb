module Aoc
  module Y2022
    module D3
      class Run < BaseRun
        def parse_input(input:)
          input.map { |line| line.split("") }
        end

        def part_1
          input.sum do |rucksack|
            split = rucksack.length / 2
            compartment_1 = rucksack[0...split]
            compartment_2 = rucksack[split..-1]

            duplicates = compartment_1 & compartment_2
            next 0 if duplicates.empty?

            duplicates.sum { |duplicate| get_priority(duplicate) }
          end
        end

        def part_2
          sum = 0
          while input.length > 0
            rucksacks = input.shift(3)
            duplicates = rucksacks[0] & rucksacks[1] & rucksacks[2]
            raise if duplicates.length > 1

            sum += get_priority(duplicates[0])
          end
          sum
        end

        def get_priority(character)
          value = character.ord - "a".ord
          value < 0 ? value + 59 : value + 1
        end
      end
    end
  end
end
