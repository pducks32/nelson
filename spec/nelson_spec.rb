require "spec_helper"

module Nelson
  RSpec.describe Nelson do
    it 'has a version number' do
      expect(Nelson::VERSION).not_to be nil
    end

    it "includes DSL by default" do
      is_expected.to be_a_kind_of DSL
    end

    describe "Term()" do
      context "when passed a Term" do
        it "returns the Term" do
          term = Term.new(4.5)
          expect(Term(term)).to be term
        end
      end
      context "when passed a Numeric" do
        it "returns a new Term" do
          expect(Term(3.5)).to be_a Term
        end
      end
    end

    describe Term do
      it { expect(Term.new(4)).to respond_to(:to_r, :to_f, :to_i) }

      describe "#initialize" do
        context "when passed no arguments" do
          it { expect { Term.new }.to raise_error ArgumentError }
        end

        it "accepts integers" do
          expect { Term.new(3) }.to_not raise_error ArgumentError
        end

        it "accepts floats" do
          expect { Term.new(3.0) }.to_not raise_error ArgumentError
        end

        it "accepts rationals" do
          expect { Term.new(Rational.new(1, 3)) }.to_not raise_error ArgumentError
        end
      end

      describe "#value" do
        it "returns the value as a rational" do
          expect(Term.new(3.0).value).to eq Rational(3, 1)
        end
      end

      describe "#raw_value" do
        it "returns the orginal type" do
          expect(Term.new(3.0).raw_value).to be 3.0
          expect(Term.new(3).raw_value).to be 3
          expect(Term.new(Rational(1, 2)).raw_value).to eq Rational(1, 2)
        end
      end

      describe "#value=" do
        subject { Term.new(3.5) }
        it { expect{ subject.value = 6.25 }.to change { subject.value }.from(3.5.to_r).to(6.25.to_r) }
        it { expect{ subject.value = 6.25 }.to change { subject.raw_value }.from(3.5).to(6.25) }
      end

      describe "#+" do

        let(:term) { Term.new Rational(3, 4) }

        context "when passed no arguments" do
          it { expect { term.+ }.to raise_error ArgumentError }
        end

        context "when passed an Expression" do
          let(:other) { AdditionExpression.new(2, 7) }
          it "calls the expression and adds itself" do
            expect(term + other).to eq 9.75
          end
        end

        context "when passed a Term" do
          let(:other) { Term.new(4.5) }
          it "adds itself to the term" do
            expect(term + other).to eq 5.25
          end
        end

        context "when passed a Numeric" do
          let(:other) { 4.5 }
          it "adds itself to the numeric" do
            expect(term + other).to eq 5.25
          end
        end
      end
    end
  end
end
