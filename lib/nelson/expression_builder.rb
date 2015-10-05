
module Nelson
  class ExpressionBuilder
    attr_accessor :terms

    def initialize(*terms)
      raise ArgumentError, "At least 1 term must be specified" unless terms.length > 0
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

    def minus(term)
      SubtractionExpressionBuilder.new(self, term)
    end

    def divided_by(term)
      DivisionExpressionBuilder.new(self, term)
    end

    def built_terms
      terms.map { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
    end
  end

  autoload :MultipicationExpressionBuilder, "nelson/expression_builders/multipication_expression_builder"
  autoload :AdditionExpressionBuilder, "nelson/expression_builders/addition_expression_builder"
  autoload :SubtractionExpressionBuilder, "nelson/expression_builders/subtraction_expression_builder"
  autoload :DivisionExpressionBuilder, "nelson/expression_builders/division_expression_builder"
end
