#!/usr/bin/env ruby
require_relative '../command_processor'

table = Table.new
robot = Robot.new(table)
processor = CommandProcessor.new(table, robot)
processor.run
