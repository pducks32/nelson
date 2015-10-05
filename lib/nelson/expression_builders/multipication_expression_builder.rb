
module Nelson
  class MultipicationExpressionBuilder < ExpressionBuilder
    def build
      MultipicationExpression.new(*built_terms)
    end
  end
end
