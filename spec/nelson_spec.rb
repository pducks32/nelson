require "spec_helper"

module Nelson
  RSpec.describe Nelson do
    it 'has a version number' do
      expect(Nelson::VERSION).not_to be nil
    end

    it "includes DSL by default" do
      is_expected.to be_a_kind_of DSL
    end
  end
end
