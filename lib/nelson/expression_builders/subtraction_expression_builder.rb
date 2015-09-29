
module Nelson
  class SubtractionExpressionBuilder < ExpressionBuilder
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      SubtractionExpression.new(*terms)
    end
  end
end
