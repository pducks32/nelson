
module Nelson
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
end
