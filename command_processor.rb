require_relative "robot"
require_relative "table"

class CommandProcessor
  COMMANDS = {
    "PLACE" => :place_command,
    "MOVE" => :move_command,
    "LEFT" => :left_command,
    "RIGHT" => :right_command,
    "REPORT" => :report_command
  }.freeze

  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def execute_command(input)
    return puts("Invalid command!") if input.strip.empty?

    command, *params = input.split
    method = COMMANDS[command]
    return puts("Invalid command!") unless method

    send(method, *params)
  rescue => e
    puts "Error executing command: #{e.message}"
  end

  def run
    puts "Enter commands for the robot:"
    puts "(Type EXIT to stop entering commands)"

    loop do
      input = gets.strip
      break if input == "EXIT"

      execute_command(input)
    end
  end

  private

  def place_command(params)
    return puts("Invalid command!") unless params&.include?(",")

    x, y, facing = params.split(",")
    unless valid_coordinate?(x.to_i, y.to_i) && valid_facing?(facing)
      return puts("Invalid command!")
    end

    @robot.place(x.to_i, y.to_i, facing)
  end

  def move_command
    @robot.move
  end

  def left_command
    @robot.left
  end

  def right_command
    @robot.right
  end

  def report_command
    puts @robot.report
  end

  def valid_coordinate?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end

  def valid_facing?(facing)
    %w[NORTH SOUTH EAST WEST].include?(facing)
  end
end
