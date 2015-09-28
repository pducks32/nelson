
module Nelson
  class MultipicationExpressionBuilder < ExpressionBuilder
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      MultipicationExpression.new(*terms)
    end
  end
end
