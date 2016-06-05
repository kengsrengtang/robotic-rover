class Rover 
  FACINGS = %w'N E S W'
  attr_accessor :x, :y, :facing, :map
  def initialize x, y, facing, map
    @x = x.to_i
    @y = y.to_i
    @facing = FACINGS.index(facing.upcase)
    @map = map
  end

  def rotate clockwise
    if clockwise
      @facing == 3 ? @facing = 0 : @facing += 1
    else
      @facing == 0 ? @facing = 3 : @facing -= 1
    end
  end

  def move
    #TODO out of map bound validation required
    case @facing
    when 0 then @y += 1 # Move towards North
    when 1 then @x += 1 # Move towards East
    when 2 then @y -= 1 # Move towards South
    when 3 then @x -= 1 # Move towards West
    end
  end

  def get_position
    "#{@x} #{@y} #{FACINGS[@facing]}"
  end
end
