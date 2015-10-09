$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nelson'

RSpec::Matchers.define :be_an_expression_with_terms do |*expected|
  match do |actual|
    actual_terms = actual.terms
    expected.all? { |e| actual_terms.include? e }
  end
end
