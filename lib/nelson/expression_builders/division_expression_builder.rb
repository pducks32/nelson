
module Nelson
  class DivisionExpressionBuilder < ExpressionBuilder
    def initialize(term1, term2)
      super(term1, term2)
    end

    def build
      DivisionExpression.new(*built_terms)
    end
  end
end
