#encoding: utf-8
require_relative '../../lib/models/relations'
require_relative '../database/db_init'

shared_context "schema context" do
  let (:ward) {EQbuddy::Ward.first} #there's only one ward

  let (:user) {EQbuddy::User.first}
  
  let (:kc) {EQbuddy::Member.find_by_pref_name("KC")}
  let (:shelyse) {EQbuddy::Member.find_by_pref_name("Shelyse")}
  let (:audrey) {EQbuddy::Member.find_by_pref_name("Audrey")}
  let (:oliver) {EQbuddy::Member.find_by_pref_name("Oliver")}
  let (:cory) {EQbuddy::Member.find_by_pref_name("Cory")}
  let (:james) {EQbuddy::Member.find_by_pref_name("James")}
  let (:bryce) {EQbuddy::Member.find_by_pref_name("Bryce")}

  let (:erb_hardy) {EQbuddy::Household.find_by_name("KC Erb & Shelyse Hardy")}
  let (:erbs) {EQbuddy::Household.find_by_name("Cory & Sharlie Erb")}
  let (:progler) {EQbuddy::Household.find_by_name("Oliver Prögler")}
  let (:wards) {EQbuddy::Household.find_by_name("Bryce & Dianne Ward")}
end
