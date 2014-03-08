#encoding: utf-8
#Pull in example database for base case
require_relative 'spec_init'

describe "KC" do
  let (:ward) {Ward.first} #there's only one ward

  let (:kc) {Member.find_by_pref_name("KC")}
  let (:shelyse) {Member.find_by_pref_name("Shelyse")}
  let (:oliver) {Member.find_by_pref_name("Oliver")}
  let (:cory) {Member.find_by_pref_name("Cory")}
  let (:james) {Member.find_by_pref_name("James")}
  let (:bryce) {Member.find_by_pref_name("Bryce")}

  let (:erb_hardy) {Household.find_by_house_name("KC Erb & Shelyse Hardy")}
  let (:erbs) {Household.find_by_house_name("Cory & Sharlie Erb")}
  let (:progler) {Household.find_by_house_name("Oliver Prögler")}
  let (:wards) {Household.find_by_house_name("Bryce & Dianne Ward")}

#AR Columns/Attributes check
  it "is named KC." do
    kc.pref_name.should == "KC"
  end
  
  it "belongs to his household" do
    kc.household.should == erb_hardy
  end
#Spouse
  it "'s spouse is Shelyse." do
    kc.spouse.pref_name.should == "Shelyse"
  end
#teachees
  it "'s March teachees are the Erbs, Oliver, and the Wards." do
    kc.teachees(3).should == [erbs, progler, wards]
  end
#teachers
  it "'s Feb teachers are Cory and Oliver." do
    kc.teachers(2).should == [cory, oliver]
  end
#companions
  it "'s Feb companions are James and Bryce." do
    kc.companions(2).should == [james, bryce]
  end

  it "'s Mar companions are Bryce and Shelyse." do
    kc.companions(3).should == [bryce, shelyse]
  end

#Attedance, teaching history / records
  it "'s attendance record's should show Feb and Mar's attendance" do
    kc.attendance_records.find_by_month(2).percent.should == 75
    kc.attendance_records.find_by_month(3).percent.should == 100
  end

  it "'s teach record's should show Feb and Mar's teaching" do
    kc.teach_records.find_by_month(2).score.should == 4.0
    kc.teach_records.find_by_month(3).score.should == 3.7

  end

#delegated attributes
#children
  it "has 1 child" do
    kc.children.length.should == 1
  end

  it "'s daughter is named Audrey" do
    kc.children.find_by_pref_name("Audrey").pref_name.should == "Audrey"
  end
#address  
  it "'s address is 752 E 800 S APT 17" do
    kc.add1.should == "752 E 800 S APT 17"
  end
#ward  
  it "belongs to his ward" do
    kc.ward.should == ward
  end
end
