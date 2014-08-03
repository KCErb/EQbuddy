#encoding: utf-8
require 'spec_helper'

describe "MentBoxView" do

  include_context "schema context"
  let(:ment) {cory.assignments.first}
  let(:controller) { EQbuddy::MentBoxController.new(ment) }
  subject(:ment_box_view) { controller.view }

  
end
