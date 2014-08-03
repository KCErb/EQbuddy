#encoding: utf-8
require 'spec_helper'

describe "KC" do
  include_context "schema context"
#AR Columns/Attributes check
  it "is named KC." do
    expect(kc.pref_name).to eq("KC")
  end

  it "belongs to his household" do
    expect(kc.household).to eq(erb_hardy)
  end
#Spouse
  it "s spouse is Shelyse." do
    expect(kc.spouse.pref_name).to eq("Shelyse")
  end
#teachees
  it "s current teachers are Cory and Oliver." do
    expect(kc.teachers).to eq([cory, oliver])
  end

#teaches
  it "s assigned to home teach"
#companions
  it "s current companions are James and Bryce." do
    expect(kc.companions).to eq([james, bryce])
  end

#Attedance, teaching history / records
  it "s attendance record's should show Feb and Mar's attendance" do
    expect(kc.attendance_records.find_by_month(2).percent).to eq(75)
    expect(kc.attendance_records.find_by_month(3).percent).to eq(100)
  end

  it "s teach record's should show Feb and Mar's teaching" do
    expect(kc.teach_records.find_by_month(2).score).to eq(4.0)
    expect(kc.teach_records.find_by_month(3).score).to eq(3.7)
  end

#delegated attributes
#children
  it "has 1 child" do
    expect(kc.children.length).to eq(1)
  end

  it "'s daughter is named Audrey" do
    expect(kc.children.find_by_pref_name("Audrey").pref_name).to eq("Audrey")
  end
#address
  it "'s address is 752 E 800 S APT 17" do
    expect(kc.add1).to eq("752 E 800 S APT 17")
  end
#ward
  it "belongs to his ward" do
    expect(kc.ward).to eq(ward)
  end
end
