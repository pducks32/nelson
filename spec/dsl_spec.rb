require 'spec_helper'

module Nelson
  describe DSL do
    describe "#product_of" do
      context "with >= 1 terms passed" do
        subject { DSL.product_of(3, 4, 5) }
        it { is_expected.to be_a MultipicationExpressionBuilder }
      end
      context "with 0 terms passed" do
        it { expect { DSL.product_of() }.to raise_error ArgumentError }
      end
    end

    describe "#sum_of" do
      context "with >= 1 terms passed" do
        subject { DSL.sum_of(3, 4, 5) }
        it { is_expected.to be_a AdditionExpressionBuilder }
      end
      context "with 0 terms passed" do
        it { expect { DSL.product_of() }.to raise_error ArgumentError }
      end
    end
  end
end
