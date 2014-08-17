module CalculordCheat
  class Cheater

    def cheat(playable_card_values, calculator_values)
      new.cheat(playable_card_values, calculator_values)
    end

    def initialize
    end

    def cheat(calculator_values)
      game_state = State.new(calculator_values)
      StateTree.generate(game_state)
    end

  end

end