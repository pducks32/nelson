require "spec_helper"

module Nelson
  describe Expression do
    describe "#initialize" do
      context "when passed arguments" do
        subject { Expression.new(3, 4) }
        it { is_expected.to be_a Expression }

        context "that are not Terms" do
          it "coerces them to terms" do
            expect(Expression.new(3, 4).terms).to all( be_a Term )
          end
        end
      end

      context "when passed no arguments" do
        it { expect { Expression.new }.to raise_error ArgumentError }
      end
    end

    describe "#terms" do
      subject { Expression.new(3, 4).terms.map(&:raw_value) }
      it { is_expected.to include(4) & include(3) }
    end

    describe "#has_term?" do
      let(:expression) { Expression.new(3, 4) }
      context "when it does not have the term" do
        subject { expression.has_term? Term(8) }
        it { is_expected.to be false }
      end
      context "when it does have the term" do
        subject { expression.has_term? Term(3) }
        it { is_expected.to be true }
      end
    end

    describe "#+" do
      subject { MultipicationExpression.new(3, 4) }

      context "when other value is a term" do
        let(:other) { MultipicationExpression.new(5, 6) }

        it "evaluates the term before adding it to the expression" do
          expect(subject + other).to eq 42
        end
      end

      context "when other value is not a term" do
        let(:other) { 30 }

        it "adds the values together" do
          expect(subject + other).to eq 42
        end
      end
    end

    describe "#-" do
      subject { MultipicationExpression.new(3, 4) }

      context "when other value is a term" do
        let(:other) { MultipicationExpression.new(5, 6) }

        it "evaluates the term before subtracting expression by it" do
          expect(subject - other).to eq -18
        end
      end

      context "when other value is not a term" do
        let(:other) { 30 }

        it "subtracts the values" do
          expect(subject - other).to eq -18
        end
      end
    end

    describe "#*" do
      subject { AdditionExpression.new(3, 4) }

      context "when other value is a term" do
        let(:other) { AdditionExpression.new(5, 6) }

        it "evaluates the term before multipling it to the expression" do
          expect(subject * other).to eq 77
        end
      end

      context "when other value is not a term" do
        let(:other) { 11 }

        it "multiplies the values together" do
          expect(subject * other).to eq 77
        end
      end
    end

    describe "#/" do
      subject { AdditionExpression.new(3, 4) }

      context "when other value is a term" do
        let(:other) { AdditionExpression.new(5, 6) }

        it "evaluates the term before dividing the expression by it" do
          expect(subject / other).to eq Rational(7, 11)
        end
      end

      context "when other value is not a term" do
        let(:other) { 11 }

        it "divides the values" do
          expect(subject / other).to eq Rational(7, 11)
        end
      end
    end

    describe "outputters" do
      subject { Nelson.product_of(6).and(4).plus(16).build }

      describe "#call" do
        it "evaluates the expresson" do
          expect(subject.call).to eq 40
        end
      end

      describe "#to_s" do
        context "when multipling two terms" do
          subject { Nelson.product_of(6).and(4).times(11).build }
          it "doesn't use a * sign" do
            expect(subject.to_s).to eq "11(6*4)"
          end

          it "puts the alone term at the beginning" do
            expect(subject.to_s).to eq "11(6*4)"
          end
        end

        it "renders a string of the expression" do
          expect(subject.to_s).to eq "(6*4)+16"
        end
      end
    end
  end
end
