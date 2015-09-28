
module Nelson
  class ExpressionBuilder
    attr_accessor :terms

    def initialize(*terms)
      @terms = terms
    end

    def and(term)
      terms << term
      return self
    end

    def times(term)
      MultipicationExpressionBuilder.new(self, term)
    end

    def plus(term)
      AdditionExpressionBuilder.new(self, term)
    end
  end

  autoload :MultipicationExpressionBuilder, "lib/expressions/multipication_expression_builder"
  autoload :AdditionExpressionBuilder, "lib/expressions/addition_expression_builder"
end
