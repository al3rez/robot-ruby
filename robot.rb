class Robot
  attr_reader :x, :y, :facing, :placed

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(table)
    @table = table
    @placed = false
  end

  def place(x, y, facing)
    return unless @table.valid_position?(x, y) && DIRECTIONS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    @placed = true
  end

  def move
    return unless placed

    case facing
    when "NORTH"
      place(x, y + 1, facing)
    when "EAST"
      place(x + 1, y, facing)
    when "SOUTH"
      place(x, y - 1, facing)
    when "WEST"
      place(x - 1, y, facing)
    end
  end

  def left
    return unless placed

    index = (DIRECTIONS.index(facing) - 1) % 4
    @facing = DIRECTIONS[index]
  end

  def right
    return unless placed

    index = (DIRECTIONS.index(facing) + 1) % 4
    @facing = DIRECTIONS[index]
  end

  def report
    return "Robot not placed on table" unless placed

    "#{x},#{y},#{facing}"
  end

  def placed?
    placed
  end
end
