#encoding: utf-8
require 'spec_helper'

describe "MentBox" do
  subject(:ment_box) { EQbuddy::MentBox.new("Test") }

  it "has a slot which is a flow" do
    expect(subject.slot.class).to eq(Shoes::Flow)
  end

  it "belongs to an assignment"
end
