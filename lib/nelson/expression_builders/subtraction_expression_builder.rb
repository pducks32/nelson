
module Nelson
  class SubtractionExpressionBuilder < ExpressionBuilder
    def build
      SubtractionExpression.new(*built_terms)
    end
  end
end
