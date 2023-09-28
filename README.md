# Toy Robot Simulator

The Toy Robot Simulator is a Ruby application that simulates a robot moving on a square tabletop, of dimensions 5 units x 5 units. The simulator reads in commands to place the robot on the table and to move, rotate, and report the robot’s position and facing direction.

## Table of Contents
- [Files](#files)
- [Usage](#usage)
  - [Running the Simulator](#running-the-simulator)
  - [Feeding Input](#feeding-input)
- [Running Tests](#running-tests)
- [Classes Description](#classes-description)
  - [Command Processor](#command-processor)
  - [Robot](#robot)
  - [Table](#table)

## Files
- `bin/runner.rb`: The runner file to execute the simulator.
- `command_processor.rb`: Processes and executes the input commands.
- `robot.rb`: Represents the robot and handles its movement and rotation.
- `table.rb`: Represents the tabletop and checks whether a position is valid on the table.

## Usage

### Running the Simulator
To run the simulator, navigate to the project directory in your terminal and run:
```sh
./bin/runner.rb
```

### Feeding Input
After running the above command, you can enter the commands one by one, pressing enter after each command:

```
PLACE 1,2,NORTH
MOVE
RIGHT
MOVE
REPORT
```

Type `EXIT` to exit the program.

Alternatively, you can feed the commands from a file, commands.txt, by modifying the runner.rb as demonstrated in the earlier section.

### Running Tests
To run the tests, navigate to the project directory in your terminal and run:

```sh
./bin/rspec
```

### Classes

#### Command Processor
The CommandProcessor class is responsible for processing and executing the commands fed into the simulator. It interacts with the Robot and Table classes to perform actions such as placing the robot, moving it, and rotating it based on the provided commands.

#### Robot
The Robot class represents the robot in the simulator. It holds information about the robot’s current position and facing direction and includes methods to move and rotate the robot.

#### Table
The Table class represents the tabletop on which the robot moves. It provides a method to check whether a given position is within the boundaries of the table.
