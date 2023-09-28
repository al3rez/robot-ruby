require "rspec"
require_relative "command_processor"

RSpec.describe CommandProcessor do
  let!(:table) { Table.new }
  let!(:robot) { Robot.new(table) }
  let(:processor) { CommandProcessor.new(table, robot) }

  describe "#execute_command" do
    it "executes PLACE command correctly" do
      expect_any_instance_of(Robot).to receive(:place).with(1, 2, "NORTH")
      processor.execute_command("PLACE 1,2,NORTH")
    end

    it "executes MOVE command correctly" do
      expect_any_instance_of(Robot).to receive(:move)
      processor.execute_command("MOVE")
    end

    it "executes LEFT command correctly" do
      expect_any_instance_of(Robot).to receive(:left)
      processor.execute_command("LEFT")
    end

    it "executes RIGHT command correctly" do
      expect_any_instance_of(Robot).to receive(:right)
      processor.execute_command("RIGHT")
    end

    it "executes REPORT command correctly" do
      allow_any_instance_of(Robot).to receive(:report).and_return("1,2,NORTH")
      expect { processor.execute_command("REPORT") }.to output("1,2,NORTH\n").to_stdout
    end

    it "handles invalid command gracefully" do
      expect { processor.execute_command("INVALID") }.to output("Invalid command!\n").to_stdout
    end

    context "with edge case inputs" do
      it "handles invalid command format gracefully" do
        invalid_command = "PLACE 1,2"
        expect { processor.execute_command(invalid_command) }.to output("Invalid command!\n").to_stdout
      end

      it "handles invalid coordinates gracefully" do
        invalid_coordinates = "PLACE 6,5,NORTH"
        expect { processor.execute_command(invalid_coordinates) }.to output("Invalid command!\n").to_stdout
      end

      it "handles invalid facing direction gracefully" do
        invalid_facing = "PLACE 1,2,INVALID"
        expect { processor.execute_command(invalid_facing) }.to output("Invalid command!\n").to_stdout
      end

      it "handles empty command gracefully" do
        empty_command = ""
        expect { processor.execute_command(empty_command) }.to output("Invalid command!\n").to_stdout
      end
    end
  end
end
