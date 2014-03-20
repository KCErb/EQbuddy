#encoding: utf-8
shared_context "schema context" do
  let (:ward) {Ward.first} #there's only one ward

  let (:user) {User.first}
  
  let (:kc) {Member.find_by_pref_name("KC")}
  let (:shelyse) {Member.find_by_pref_name("Shelyse")}
  let (:audrey) {Member.find_by_pref_name("Audrey")}
  let (:oliver) {Member.find_by_pref_name("Oliver")}
  let (:cory) {Member.find_by_pref_name("Cory")}
  let (:james) {Member.find_by_pref_name("James")}
  let (:bryce) {Member.find_by_pref_name("Bryce")}

  let (:erb_hardy) {Household.find_by_name("KC Erb & Shelyse Hardy")}
  let (:erbs) {Household.find_by_name("Cory & Sharlie Erb")}
  let (:progler) {Household.find_by_name("Oliver Prögler")}
  let (:wards) {Household.find_by_name("Bryce & Dianne Ward")}
end
