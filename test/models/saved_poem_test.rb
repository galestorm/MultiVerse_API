require "test_helper"

describe SavedPoem do
  let(:saved_poem) { SavedPoem.new }

  it "must be valid" do
    value(saved_poem).must_be :valid?
  end
end
