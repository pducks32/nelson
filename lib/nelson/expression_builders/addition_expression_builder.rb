
module Nelson
  class AdditionExpressionBuilder < ExpressionBuilder
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      AdditionExpression.new(*terms)
    end
  end
end
