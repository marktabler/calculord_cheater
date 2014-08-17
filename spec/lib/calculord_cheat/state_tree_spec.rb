require_relative "../../spec_helper"

describe CalculordCheat::StateTree do
  let(:starting_state) { CalculordCheat::State.new([1, 2, 3, 4]) }
  let(:large_starting_state) { CalculordCheat::State.new([1, 2, 3, 4, 3, 4, 5]) }
  let(:state_tree) { CalculordCheat::StateTree.new(starting_state) }
  let(:large_state_tree) { CalculordCheat::StateTree.new(large_starting_state) }
  
  it "generates the appropriate number of steps" do
    expect(state_tree.depth).to eq 3
    expect(large_state_tree.depth).to eq 6
  end

  it "can describe a path from root to a final state" do
    puts state_tree.path_to(CalculordCheat::State.new([15])).map(&:transformation)
  end
end