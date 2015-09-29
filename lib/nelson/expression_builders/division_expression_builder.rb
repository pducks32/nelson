
module Nelson
  class DivisionExpressionBuilder < ExpressionBuilder
    def initialize(term1, term2)
      super(term1, term2)
    end
    
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      DivisionExpression.new(*terms)
    end
  end
end
