require "nelson/version"

module Nelson
  def self.product_of(*terms)
    MultipicationExpressionBuilder.new(*terms)
  end

  def self.sum_of(*terms)
    AdditionExpressionBuilder.new(*terms)
  end


  class Expression
    attr_accessor :terms

    def initialize(*terms)
      @terms = terms
    end

    def *(term)
      rhs_value = self.call
      lhs_value = term.respond_to?(:call) ? term.call : term
      MultipicationExpression.new(rhs_value, lhs_value).call
    end

    def +(term)
      rhs_value = self.call
      lhs_value = term.respond_to?(:call) ? term.call : term
      AdditionExpression.new(rhs_value, lhs_value).call
    end
  end

  class ExpressionBuilder
    attr_accessor :terms

    def initialize(*terms)
      @terms = terms
    end

    def and(term)
      terms << term
      return self
    end

    def times(term)
      MultipicationExpressionBuilder.new(self, term)
    end

    def plus(term)
      AdditionExpressionBuilder.new(self, term)
    end
  end

  class MultipicationExpression < Expression
    def call
      terms.reduce(:*)
    end

    def to_s
      terms.sort_by { |t| t.is_a?(Expression) ? 1 : 0 }.reduce("") do |c, t|
        case t
        when Expression
          c << "(#{t})"
        else
          c = [c, t].map(&:to_s).reject(&:empty?).join("*")
        end
      end
    end
  end

  class MultipicationExpressionBuilder < ExpressionBuilder
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      MultipicationExpression.new(*terms)
    end
  end

  class AdditionExpression < Expression
    def call
      terms.reduce(:+)
    end


    def to_s
      terms.map do |t|
        t.is_a?(Expression) ? "(#{t})" : t
      end.join("+")
    end
  end

  class AdditionExpressionBuilder < ExpressionBuilder
    def build
      terms.map! { |e| e.is_a?(ExpressionBuilder) ? e.build : e }
      AdditionExpression.new(*terms)
    end
  end
end
