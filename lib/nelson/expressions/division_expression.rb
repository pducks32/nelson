
module Nelson
  class DivisionExpression < Expression
    def initialize(term1, term2)
      super(term1.to_f, term2.to_f)
    end

    def call
      terms.reduce(:/)
    end

    def to_s
      terms.sort_by { |t| t.is_a?(Expression) ? 1 : 0 }.reduce("") do |c, t|
        case t
        when Expression
          c << "(#{t})"
        else
          c = [c, t].map(&:to_s).reject(&:empty?).join("/")
        end
      end
    end
  end
end
