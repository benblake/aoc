require "bundler/gem_tasks"
Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }

task :run, [:year, :day] do |t, args|
  year = args[:year]
  day = args[:day]
  puts year
  puts day
  input_file =  File.join(File.dirname(__FILE__), "lib/aoc/y_#{year}/d_#{day}/input.txt")

  run = Object.const_get("Aoc::Y#{year}::D#{day}::Run").new(input_file: input_file)

  puts "Part 1 solution: #{run.part_1}"
  puts "Part 2 solution: #{run.part_2}"
end