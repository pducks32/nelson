
module Nelson
  module DSL
    def self.product_of(*terms)
      MultipicationExpressionBuilder.new(*terms)
    end

    def self.sum_of(*terms)
      AdditionExpressionBuilder.new(*terms)
    end
  end
end
