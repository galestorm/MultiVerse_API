require "test_helper"

describe Experience do
  let(:experience) { Experience.new }

  it "must be valid" do
    value(experience).must_be :valid?
  end
end
