
module Nelson
  class Expression
    attr_accessor :terms

    def initialize(*terms)
      @terms = terms
    end

    def *(term)
      rhs_value = self.call
      lhs_value = term.respond_to?(:call) ? term.call : term
      MultipicationExpression.new(rhs_value, lhs_value).call
    end

    def +(term)
      rhs_value = self.call
      lhs_value = term.respond_to?(:call) ? term.call : term
      AdditionExpression.new(rhs_value, lhs_value).call
    end
  end

  autoload :MultipicationExpression, "lib/expressions/multipication_expression"
  autoload :AdditionExpression, "lib/expressions/addition_expression"
end
