module CalculordCheat
  class State
    
    attr_accessor :transformation

    def initialize(values, derived_value = nil, transformation = "Given")
      @values = values.dup
      @values << derived_value if derived_value
      @values = @values.flatten.sort
      @derived_value = derived_value
      @transformation = transformation
    end

    def ==(other)
      values == other.values
    end

    def eql?(other)
      values == other.values
    end

    def values
      @values
    end

    def hash
      @values.hash
    end

    def size
      @values.size
    end

    def parent_state
      if transformation == "Given"
        nil
      else
        parent_values = @values.dup
        parent_values.delete_at(parent_values.index(@derived_value))
        transformed_values = transformation.split(/[\+\*\-]/).map(&:to_i)
        State.new(parent_values + [transformed_values])
      end
    end

    def substates
      tuples = @values.combination(2).map(&:sort).uniq
      tuples.map do |t|
        new_values = @values.dup
        new_values.delete_at(new_values.index(t.first))
        new_values.delete_at(new_values.index(t.last))
        [State.new(new_values, t.first + t.last, "#{t.first} + #{t.last}"),
        State.new(new_values, t.first * t.last, "#{t.first} * #{t.last}"),
        State.new(new_values, t.first - t.last, "#{t.first} - #{t.last}"),
        State.new(new_values, t.last - t.first, "#{t.last} - #{t.first}")]
      end.flatten
    end
  end
end