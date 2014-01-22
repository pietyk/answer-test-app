require "spec_helper"

describe ApplicationHelper do
  describe "#polls" do
    it "return the array" do
      expect(helper.polls).to be_an_instance_of(Array)
    end
  end
end
