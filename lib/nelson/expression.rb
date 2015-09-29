
module Nelson
  class Expression
    attr_accessor :terms

    def initialize(*terms)
      raise ArgumentError, "At least 1 term must be specified" unless terms.length > 0
      @terms = terms
    end

    def *(term)
      rhs_value = self.call
      lhs_value = try_to_eval term
      MultipicationExpression.new(rhs_value, lhs_value).call
    end

    def +(term)
      rhs_value = self.call
      lhs_value = try_to_eval term
      AdditionExpression.new(rhs_value, lhs_value).call
    end

    def -(term)
      rhs_value = self.call
      lhs_value = try_to_eval term
      SubtractionExpression.new(rhs_value, lhs_value).call
    end

    private

    def try_to_eval(term)
      term.respond_to?(:call) ? term.call : term
    end
  end

  autoload :MultipicationExpression, "nelson/expressions/multipication_expression"
  autoload :AdditionExpression, "nelson/expressions/addition_expression"
  autoload :SubtractionExpression, "nelson/expressions/subtraction_expression"
end
