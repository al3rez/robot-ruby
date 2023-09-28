require_relative "robot"
require_relative "tablep"
require "rspec"

RSpec.describe Robot do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }

  describe "#place" do
    context "with valid parameters" do
      it "places the robot on the table with valid coordinates and facing" do
        robot.place(1, 2, "NORTH")
        expect(robot.report).to eq("1,2,NORTH")
      end
    end

    context "with invalid parameters" do
      it "does not place the robot on the table with invalid coordinates" do
        robot.place(5, 5, "NORTH")
        expect(robot).not_to be_placed
      end

      it "does not place the robot on the table with invalid facing" do
        robot.place(1, 1, "INVALID")
        expect(robot).not_to be_placed
      end
    end
  end

  describe "#move" do
    it "moves the robot one unit forward in the direction it is currently facing" do
      robot.place(1, 2, "NORTH")
      robot.move
      expect(robot.report).to eq("1,3,NORTH")
    end

    it "does not allow the robot to move and fall off the table" do
      robot.place(0, 0, "SOUTH")
      robot.move
      expect(robot.report).to eq("0,0,SOUTH")
    end

    it "ignores move command if the robot is not placed on the table" do
      robot.move
      expect(robot.report).to eq("Robot not placed on table")
    end
  end

  describe "#left" do
    it "rotates the robot 90 degrees to the left" do
      robot.place(1, 2, "NORTH")
      robot.left
      expect(robot.report).to eq("1,2,WEST")
    end

    it "ignores left command if the robot is not placed on the table" do
      robot.left
      expect(robot.report).to eq("Robot not placed on table")
    end
  end

  describe "#right" do
    it "rotates the robot 90 degrees to the right" do
      robot.place(1, 2, "NORTH")
      robot.right
      expect(robot.report).to eq("1,2,EAST")
    end

    it "ignores right command if the robot is not placed on the table" do
      robot.right
      expect(robot.report).to eq("Robot not placed on table")
    end
  end

  describe "#report" do
    it "announces the x,y, and facing of the robot if it is on the table" do
      robot.place(1, 2, "NORTH")
      expect(robot.report).to eq("1,2,NORTH")
    end

    it "announces that the robot is not on the table if it has not been placed" do
      expect(robot.report).to eq("Robot not placed on table")
    end
  end
end
