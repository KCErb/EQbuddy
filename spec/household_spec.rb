require_relative 'spec_init'
require_relative 'schema_context'

describe "Erb-Hardy Household" do
  include_context "schema context"

  #Basic Attributes
  it "'s House Name is KC Erb & Shelyse Hardy" do
    erb_hardy.name.should == "KC Erb & Shelyse Hardy"
  end

  #Date handling?
  it "moved into the ward on June" do
    erb_hardy.move_in.month.should == 6
  end

  #Relations
  it "belongs to ward" do
    erb_hardy.ward.should == ward
  end

  it "notes: Baby note was created Feb 2nd" do
    erb_hardy.notes.first.date.month.should == 2
    erb_hardy.notes.first.date.day.should == 2
  end
  
  it "'s Taught records should show HT history" do
    erb_hardy.taught_records.find_by_month(2).score.should == 1
    erb_hardy.taught_records.find_by_month(3).score.should == 0
  end

  it "'s heads should be KC and Shelyse" do
    erb_hardy.heads.should == [kc, shelyse]
  end

  it "'s children should be Audrey" do
    erb_hardy.children.should == [audrey]
  end

  it "tags: Has Car" do
    erb_hardy.tags.first.name.should == "Has Car"
  end
  
  it "teachers should be Cory and Oliver" do
   erb_hardy.teachers.should == [cory, oliver]
  end

end
