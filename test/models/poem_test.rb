require "test_helper"

describe Poem do
  let(:poem) { Poem.new }

  it "must be valid" do
    value(poem).must_be :valid?
  end
end
