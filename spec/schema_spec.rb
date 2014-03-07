#encoding: utf-8
#Pull in example database for base case
require_relative 'db_spec_init'


describe "KC" do
  let (:kc) {Member.find_by_pref_name("KC")}
  let (:shelyse) {Member.find_by_pref_name("Shelyse")}
  let (:oliver) {Member.find_by_pref_name("Oliver")}
  let (:cory) {Member.find_by_pref_name("Cory")}
  let (:james) {Member.find_by_pref_name("James")}
  let (:bryce) {Member.find_by_pref_name("Bryce")}

  let (:erbs) {Household.find_by_house_name("Cory & Sharlie Erb")}
  let (:progler) {Household.find_by_house_name("Oliver Prögler")}
  let (:wards) {Household.find_by_house_name("Bryce & Dianne Ward")}


  it "is named KC." do
    kc.pref_name.should == "KC"
  end

  it "'s spouse is Shelyse." do
    kc.spouse.pref_name.should == "Shelyse"
  end

  it "'s March teachees are the Erbs, Oliver, and the Wards." do
    kc.teachees(3).should == [erbs, progler, wards]
  end

  it "'s Feb teachers are Cory and Oliver." do
    kc.teachers(2).should == [cory, oliver]
  end

  it "'s Feb companions are James and Bryce." do
    kc.companions(2).should == [james, bryce]
  end

  it "'s Mar companions are Bryce and Shelyse." do
    kc.companions(3).should == [bryce, shelyse]
  end

  it "has 1 child" do
    kc.children.length.should == 1
  end

  it "'s daughter is named Audrey" do
    kc.children.find_by_pref_name("Audrey").pref_name.should == "Audrey"
  end

end
