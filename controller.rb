require_relative 'rover'
require_relative 'map'
class Controller
  attr_accessor :rover
  def initialize
    map = init_map
    @rover = init_rover map
    mass_move
    puts @rover.get_position
  end

  def init_map
    puts 'Please enter the upper-right coordinates of the plateau. eg:5 5'
    #TODO input's validation needed
    input = gets.chomp.split(" ")
    Map.new input[0], input[1]
  end

  def init_rover map
    puts "Please enter the rover's position. eg 1 2 N(x=1, y=2, facing=NORTH)" 
    #TODO input's validation needed
    input = gets.chomp.split(" ")
    Rover.new input[0], input[1], input[2].upcase, map
  end

  def mass_move
    puts 'Please enter the series of instructions telling the rover how to explore the plateau. eg: LMLMLMLMM'
    #TODO input's validation needed
    instructions = gets.chomp.to_s
    instructions.upcase.split('').each do |inst|
      if ['L', 'R'].include? inst
        @rover.rotate inst == 'R'
      elsif inst == 'M'
        @rover.move
      end
    end
  end
end
