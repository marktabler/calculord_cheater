require_relative "../../spec_helper"

describe CalculordCheat::State do
  let(:state) { CalculordCheat::State.new([1, 2, 3]) }
  
  it "compiles substates" do
    expect(state.substates.first).to be_a CalculordCheat::State
  end

  it "compiles the right number of substates" do
    expect(state.substates.size).to eq 12
  end

  it "defines equality as equality of values" do
    other_state = CalculordCheat::State.new([1, 2, 3])
    expect(state).to eq other_state
    expect([state, other_state].uniq.size).to eq 1
  end

  it "describes a transformation path" do
    substate = state.substates.select { |s| s.values == [1, 6] }.first
    expect(substate.transformation).to eq "2 * 3"
  end

  it "describes its parent state" do
    substate = CalculordCheat::State.new([1], 6, "2 * 3")
    expect(substate.parent_state).to eq state
  end
end