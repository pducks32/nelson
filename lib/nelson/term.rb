
module Nelson
  class Term
    include Comparable
    attr_reader :raw_value, :value

    def initialize(value)
      @raw_value = value
      @value = value.is_a?(Numeric) ? value.to_r : value
    end

    def <=>(other)
      other <=> @value
    end

    def value=(new_value)
      @raw_value = new_value
      @value = @raw_value.to_r
    end

    def +(other)
      if other.is_a? Term
        Term.new(value + other.value)
      elsif other.is_a? Numeric
        Term.new(value + other)
      elsif other.is_a? Expression
        Term.new(value + other.call)
      else
        if other.respond_to? :coerce
          a, b = other.coerce(self)
          a + b
        else
          raise TypeError, "#{other.class} can't be coerced into Term"
        end
      end
    end

    def -(other)
      if other.is_a? Term
        Term.new(value - other.value)
      elsif other.is_a? Numeric
        Term.new(value - other)
      else
        if other.respond_to? :coerce
          a, b = other.coerce(self)
          a - b
        else
          raise TypeError, "#{other.class} can't be coerced into Term"
        end
      end
    end

    def *(other)
      if other.is_a? Term
        Term.new(value * other.value)
      elsif other.is_a? Numeric
        Term.new(value * other)
      else
        if other.respond_to? :coerce
          a, b = other.coerce(self)
          a * b
        else
          raise TypeError, "#{other.class} can't be coerced into Term"
        end
      end
    end

    def /(other)
      if other.is_a? Term
        Term.new(value / other.value)
      elsif other.is_a? Numeric
        Term.new(value / other)
      else
        if other.respond_to? :coerce
          a, b = other.coerce(self)
          a / b
        else
          raise TypeError, "#{other.class} can't be coerced into Term"
        end
      end
    end

    def coerce(other)
      [Term.new(other), self]
    end

    def to_s
      raw_value.to_s
    end

    def to_r
      value
    end

    def to_f
      value.to_f
    end

    def to_i
      value.to_i
    end
  end
end

def Term(value)
  case value
  when Nelson::Term, Nelson::Expression
    value
  when Numeric
    Nelson::Term.new(value)
  end
end
