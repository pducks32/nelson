
module Nelson
  class AdditionExpressionBuilder < ExpressionBuilder
    def build
      AdditionExpression.new(*built_terms)
    end
  end
end
