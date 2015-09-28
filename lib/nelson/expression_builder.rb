
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

  autoload :MultipicationExpressionBuilder, "nelson/expression_builders/multipication_expression_builder"
  autoload :AdditionExpressionBuilder, "nelson/expression_builders/addition_expression_builder"
end
