module CalculordCheat
  class StateTree

    def initialize(starting_state)
      @steps = {}
      @steps[0] = starting_state
      @steps[1] = starting_state.substates
      generate!
    end

    def depth
      @steps.keys.sort.last
    end

    def starting_state
      @steps[0]
    end

    def depth_of_term_count(term_count)
      starting_state.size - term_count
    end

    def path_to(given_state)
      final_state = @steps[depth_of_term_count(given_state.size)].select { |step| step == given_state }.first
      state_chain = [final_state]
      until state_chain.first == starting_state
        target_state = state_chain.first.parent_state
        if target_state == starting_state
          state_chain.unshift(starting_state)
        else
          state_chain.unshift(@steps[depth_of_term_count(target_state.size)].select { |step| step == target_state }.first)
        end
      end
      state_chain
    end

    def generate!
      step_count = 1

      until @steps[step_count].first.values.size == 1 do
        puts step_count
        puts @steps[step_count].size
        step_count += 1
        
        @steps[step_count] = @steps[step_count - 1].map { |s| s.substates }.flatten.uniq
      end
    end
  end
end