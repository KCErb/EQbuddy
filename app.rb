#encoding: utf-8
require_relative 'lib/init'
Shoes.app width: 900, height: 700, title: "EQbuddy" do
  background white
  extend EQbuddy
  start(app)
end
