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

  it "tags: Has Car" do
    erb_hardy.tags.first.name.should == "Has Car"
  end

  it "notes: Baby note was created Feb 2nd" do
    erb_hardy.notes.first.date.month.should == 2
    erb_hardy.notes.first.date.day.should == 2
  end
  
  it "'s Taught records should show HT history"do

  end
end
