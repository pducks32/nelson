
module Nelson
  module DSL
    module_function

    def product_of(*terms)
      MultipicationExpressionBuilder.new(*terms)
    end

    def sum_of(*terms)
      AdditionExpressionBuilder.new(*terms)
    end

    def quotient_of(*terms)
      DivisionExpressionBuilder.new(*terms)
    end

    def difference_of(*terms)
      SubtractionExpressionBuilder.new(*terms)
    end
    alias :difference_between :difference_of
  end
end
