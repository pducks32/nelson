require "spec_helper"

module Nelson
  describe Expression do
    describe "#initialize" do
      context "when passed arguments" do
        subject { Expression.new(3, 4) }
        it { is_expected.to be_a Expression }

        it "sets the terms passed" do
          expect(subject.terms).to include 3, 4
        end
      end

      context "when passed no arguments" do
        it { expect { Expression.new }.to raise_error ArgumentError }
      end
    end

    describe "#+" do
      subject { MultipicationExpression.new(3, 4) }

      context "when other value is a term" do
        let(:other) { MultipicationExpression.new(5, 6) }

        it "evaluates the term before adding it to expression" do
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
  end
end
