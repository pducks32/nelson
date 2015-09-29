require "spec_helper"

module Nelson
  describe ExpressionBuilder do
    describe "#initialize" do
      context "when passed no arguments" do
        it { expect { ExpressionBuilder.new }.to raise_error ArgumentError }
      end
    end

    describe "#and" do
      subject { ExpressionBuilder.new(3, 4) }
      it "adds the term to terms" do
        expect { subject.and(5) }.to change { subject.terms.count }.by(1)
      end
    end

    describe "#times" do
      subject { ExpressionBuilder.new(3, 4) }

      it "builds a new MultipicationExpressionBuilder" do
        expect(subject.times(4)).to be_a MultipicationExpressionBuilder
      end

      it "adds itself and the passed argument to the new builder" do
        builder = ExpressionBuilder.new(3, 4)
        expect(subject.times(4).terms).to include subject, 4
      end
    end

    describe "#plus" do
      it "builds a new AdditionExpressionBuilder" do
        builder = ExpressionBuilder.new(3, 4)
        expect(builder.plus(4)).to be_a AdditionExpressionBuilder
      end

      it "adds itself and the passed argument to the new builder" do
        builder = ExpressionBuilder.new(3, 4)
        expect(builder.plus(4).terms).to include builder, 4
      end
    end

    describe "#minus" do
      it "builds a new SubtractionExpressionBuilder" do
        builder = ExpressionBuilder.new(3, 4)
        expect(builder.minus(4)).to be_a AdditionExpressionBuilder
      end

      it "adds itself and the passed argument to the new builder" do
        builder = ExpressionBuilder.new(3, 4)
        expect(builder.minus(4).terms).to include builder, 4
      end
    end
  end
end
