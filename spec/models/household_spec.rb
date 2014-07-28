#encoding: utf-8
require 'spec_helper'

describe "Erb-Hardy Household" do
  include_context "schema context"

  #Basic Attributes
  it "'s House Name is KC Erb & Shelyse Hardy" do
    expect(erb_hardy.name).to eq("KC Erb & Shelyse Hardy")
  end

  #Date handling?
  it "moved into the ward in June" do
    expect(erb_hardy.move_in.month).to eq(6)
  end

  #Relations
  it "belongs to ward" do
    expect(erb_hardy.ward).to eq(ward)
  end

  it "notes: Baby note was created Feb 2nd" do
    expect(erb_hardy.notes.first.date.month).to eq(2)
  end
  
  it "'s Taught records should show HT history" do
    expect(erb_hardy.taught_records.find_by_month(2).score).to eq(1)
  end

  it "'s heads should be KC and Shelyse" do
    expect(erb_hardy.heads).to eq([kc, shelyse])
  end

  it "'s children should be Audrey" do
    expect(erb_hardy.children).to eq([audrey])
  end

  it "tags: Has Car" do
    expect(erb_hardy.tags.first.name).to eq("Has Car")
  end
  
  it "teachers should be Cory and Oliver" do
    expect(erb_hardy.teachers).to eq([cory, oliver])
  end

end
