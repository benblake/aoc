module Aoc
  module Y2022
    module D2
      class Run < BaseRun
        def parse_input(input:)
          input.map do |line|
            elf, me = line.split(" ")
            { elf: elf, me: me }
          end
        end

        def part_1
          input.sum do |round|
            round_score(round[:elf], round[:me])
          end
        end

        def part_2
          input.sum do |round|
            my_play = determine_play(round[:elf], round[:me])
            round_score(round[:elf], my_play)
          end
        end

        def round_score(elf_play, my_play)
          score = { "X" => 1, "Y" => 2, "Z" => 3 }[my_play]

          return score if lost(elf_play, my_play)
          return score + 6 if won(elf_play, my_play)
          score + 3
        end

        def lost(elf_play, my_play)
          [
            ["A", "Z"],
            ["B", "X"],
            ["C", "Y"]
          ].include?([elf_play, my_play])
        end

        def won(elf_play, my_play)
          [
            ["B", "Z"],
            ["C", "X"],
            ["A", "Y"]
          ].include?([elf_play, my_play])
        end

        def determine_play(elf_play, round_result)
          loss_map = {
            "A" => "Z",
            "B" => "X",
            "C" => "Y",
          }

          win_map = {
            "B" => "Z",
            "C" => "X",
            "A" => "Y",
          }

          draw_map = {
            "A" => "X",
            "B" => "Y",
            "C" => "Z",
          }

          return loss_map[elf_play] if round_result == "X"
          return win_map[elf_play] if round_result == "Z"
          draw_map[elf_play]
        end
      end
    end
  end
end
