#encoding: utf-8
require_relative 'lib/init'
Shoes.app width: 500, height: 400, left: 100, top: 200, title: "EQbuddy" do
  extend EQbuddy
  start
end
