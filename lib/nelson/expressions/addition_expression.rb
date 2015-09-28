
module Nelson
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
end
