require 'spec_helper'

describe "District" do
  include_context "schema context"
  subject(:district) { EQbuddy::District.create( color: "blue") }

  it "has a color" do
    expect(subject.color).to eq("blue")
  end

end
