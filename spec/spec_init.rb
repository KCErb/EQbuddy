#encoding: utf-8
path = File.expand_path File.dirname(__FILE__)
$DIR = path.gsub(/\/spec/,'')

require 'active_record'

File.delete(path + '/spec_test.db') if File.file?(path + '/spec_test.db')

ActiveRecord::Base.logger = Logger.new(File.open(path + '/spec_test.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter  => 'jdbcsqlite3',
  :database => path + '/spec_test.db'
)

CURR_MONTH = Time.now.month

#Pull in the EQbuddy files
require_relative $DIR + '/lib/schema'
require_relative $DIR + '/lib/relations'



ward = Ward.create(ward_number: '2168', stake_number: '1')
user = User.create(name: 'KC Erb', calling: 'eqp')

user.ward = ward
#Members
kc =      Member.create( last_name: 'Erb', pref_name: 'KC', gender: 'Male', phone: '8015548253',
                         email: 'iamkcerb@gmail.com', home_teaches?: true, dob: Date.new(1988,4,28) )
shelyse = Member.create( last_name: 'Hardy', pref_name: 'Shelyse', gender: 'Female', phone: '8015548253',
                         home_teaches?: true, dob: Date.new(1991,3,17))
audrey =  Member.create( last_name: 'Erb', pref_name: 'Audrey', gender: 'Female', home_teaches?: false, 
                         dob: Date.new(2014,1,28))
oliver =  Member.create( last_name: 'Prögler', pref_name: 'Oliver', gender: 'Male', email: 'iamkcerb@gmail.com',
                         home_teaches?: true, dob: Date.new(1972,07,01))
cory =    Member.create( last_name: 'Erb', pref_name: 'Cory', gender: 'Male', phone: '8015548253', 
                         email: 'iamkcerb@gmail.com', home_teaches?: true, image_id: 't200jmj99', 
                         dob: Date.new(1988,4,28))
sharlie = Member.create( last_name: 'Erb', pref_name: 'Sharlie', gender: 'Female', email: 'iamkcerb@gmail.com',
                         home_teaches?: false, dob: Date.new(1988,3,4))
adele =   Member.create( last_name: 'Erb', pref_name: 'Adele', gender: 'Female', home_teaches?: false, 
                         dob: Date.new(2013,05,26))
mildred = Member.create( last_name: 'Tucker', pref_name: 'Mildred', gender: 'Female', home_teaches?: false, 
                         dob: Date.new(1938,12,22))
james =   Member.create( last_name: 'Hall', pref_name: 'James', gender: 'Male', phone: '8015548253',
                         email: 'iamkcerb@gmail.com', home_teaches?: true, dob: Date.new(1987,9,21))
caitlyn = Member.create( last_name: 'Hall', pref_name: 'Caitlyn', gender: 'Female', phone: '8015548253', 
                         home_teaches?: false, dob: Date.new(1985,7,11))
bryce =   Member.create( last_name: 'Ward', pref_name: 'Bryce', gender: 'Male', phone: '8015548253', 
                         home_teaches?: true, dob: Date.new(1983,9,23))
dianne =  Member.create( last_name: 'Ward', pref_name: 'Dianne', other_names: 'Ruth', gender: 'Female', 
                         email: 'iamkcerb@gmail.com', home_teaches?: false, dob: Date.new(1984,3,1))
less =    Member.create( last_name: 'Active', pref_name: 'Less', gender: 'Male')

#Marriages
kc.spouse = shelyse
shelyse.spouse = kc
cory.spouse = sharlie
sharlie.spouse = cory
james.spouse = caitlyn
caitlyn.spouse = james
bryce.spouse = dianne
dianne.spouse = bryce

#Households
erb_hardy = Household.create( house_name:"KC Erb & Shelyse Hardy", add1: '752 E 800 S APT 17', latitude: 40.751508,
                              longitude: -111.869295, phone: '8015548253', email: 'iamkcerb@gmail.com', 
                              home_taught?: true, image_id: 't100jmj89', move_in: Date.new(2012,6,30))
erbs =      Household.create( house_name: "Cory & Sharlie Erb", add1: '800 E 854 S', latitude: 40.750878, 
                              longitude: -111.867949, phone: '8015548253', home_taught?: true, 
                              image_id: 't200jmj89', move_in: Date.new(2013,3,10))
progler =   Household.create( house_name: "Oliver Prögler", add1: '1062 McClelland St.', add2: 'Apt B', 
                              latitude: 40.745670, longitude: -111.861468, home_taught?: false, move_in: Date.new(2010,12,1))
tucker =    Household.create( house_name: "Mildred Tucker", add1: '967 S 900 E', latitude: 40.747956, 
                              longitude: -111.865184, home_taught?: false, move_in: Date.new(1974,3,15))
halls =     Household.create( house_name: "James & Caitlyn Hall", add1: '752 E 800 S', add2: 'APT 21', 
                               latitude: 40.751500, longitude: -111.869295, home_taught?: true, move_in: Date.new(2009,7,15), 
                               move_out: Date.new(2014,2,20))
wards =     Household.create( house_name: "Bryce & Dianne Ward", add1: '1012 Lincoln', latitude: 40.747135, 
                              longitude: -111.864120, email: 'iamkcerb@gmail.com', move_in: Date.new(2012,11,15))
active =    Household.create( house_name: "Less Active", add1: '123 Fake St.', latitude: 40.750878, longitude: -111.867949,
                              move_in: Date.new(2005,9,11))


#Connect members to households, and eachother
erb_hardy.heads << [kc, shelyse]
erb_hardy.children << [audrey]
erbs.heads << [cory, sharlie]
erbs.children << [adele]
progler.heads << [oliver]
tucker.heads << [mildred]
halls.heads << [james, caitlyn]
wards.heads << [bryce, dianne]
active.heads << [less]

#District
d1 = District.create

#Assignments
a1 = Assignment.create(month: 2)
a2 = Assignment.create(month: 2)

a3 = Assignment.create(month: 3)
a4 = Assignment.create(month: 3)

a5 = Assignment.create(month: 3)

d1.assignments << [a1, a2, a3, a4]
d1.district_leader = cory

#---
#Feb
#---
a1.teachers << [cory, oliver]
a1.teachees << [erb_hardy, halls, wards]

a2.teachers << [kc, james, bryce]
a2.teachees << [erbs, progler]
#---
#Mar
#---
a3.teachers << [cory, oliver]
a3.teachees << [erb_hardy]

a4.teachers << [kc, bryce]
a4.teachees << [erbs, progler]

a5.teachers << [kc, shelyse]
a5.teachees << [wards]

#Assign HHs to Ward
[erbs, erb_hardy, progler, tucker, halls, wards, active].each do |household|
  ward.households << [household]
end


#Extras!
#Create some tags
t1 = Tag.create(name: "Do not contact")
t2 = Tag.create(name: "Has Car")
t3 = Tag.create(name: "Computer Skills")

active.tags << [t1]
erb_hardy.tags << [t2, t3]
erbs.tags << [t2]


#Create some notes
n1 = Note.create(description: "Broken legs", date: Time.now - 5*24*60*60)
n2 = Note.create(description: "Needs help in garden", date: Time.now)

tucker.notes << [n1, n2]

#Create action items
a1 = ActionItem.create(expires: Time.now + 7*24*60*60, description: "Mow a lawn")

user.action_items << [a1]

#Create settings
s1 = Setting.create(use_gmail?: true)
s2 = Setting.create(use_voice?: true)
s3 = Setting.create(teach_self: "disallow")
s4 = Setting.create(teach_comp: "warn")
s5 = Setting.create(teach_teacher: "allow")

[s1, s2, s3, s4, s5].each do |setting|
  user.settings << setting
end
#Create taught records
#Feb
erb_hardy.taught_records.create( month: 2, score: 1)
halls.taught_records.create(     month: 2, score: 3)
wards.taught_records.create(     month: 2, score: 2)

erbs.taught_records.create(      month:2, score: 4)
progler.taught_records.create(   month:2, score: 4)

#Mar
erb_hardy.taught_records.create( month: 3, score: 0)

erbs.taught_records.create(    month: 3, score: 3)
progler.taught_records.create( month: 3, score: 4)

wards.taught_records.create( month: 3, score: 4)

#create teach records
#Feb
cory.teach_records.create(   month: 2, score: 2.0)
oliver.teach_records.create( month: 2, score: 2.0)

kc.teach_records.create(    month: 2, score: 4.0)
james.teach_records.create( month: 2, score: 4.0)
bryce.teach_records.create( month: 2, score: 4.0)

#Mar
cory.teach_records.create(   month: 3, score: 0.0)
oliver.teach_records.create( month: 3, score: 0.0)

kc.teach_records.create(      month: 3, score: 3.7)
bryce.teach_records.create(   month: 3, score: 3.5)

shelyse.teach_records.create( month: 3, score: 4.0)

#Create attendance records
#Feb
kc.attendance_records.create(     month: 2, percent: 75)
cory.attendance_records.create(   month: 2, percent: 100)
oliver.attendance_records.create( month: 2, percent: 75)
bryce.attendance_records.create(  month: 2, percent: 25)
james.attendance_records.create(  month: 2, percent: 50)

#Mar
kc.attendance_records.create(     month: 3, percent: 100)
cory.attendance_records.create(   month: 3, percent: 100)
oliver.attendance_records.create( month: 3, percent: 0)
bryce.attendance_records.create(  month: 3, percent: 100)
