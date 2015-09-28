
module Nelson
  module DSL
    module_function

    def product_of(*terms)
      MultipicationExpressionBuilder.new(*terms)
    end

    def sum_of(*terms)
      AdditionExpressionBuilder.new(*terms)
    end
  end
end
