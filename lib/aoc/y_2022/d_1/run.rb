module Aoc
  module Y2022
    module D1
      class Run < BaseRun
        def part_1
          calories = [0]

          input.each do |line|
            if line == ""
              calories << 0
              next
            end
            
            calories[-1] += line.to_i 
          end
          
          calories.max
        end

        def part_2
          calories = [0]

          input.each do |line|
            if line == ""
              calories << 0
              next
            end
            
            calories[-1] += line.to_i 
          end

          calories.sort.reverse[0..2].sum
        end
      end
    end
  end
end
