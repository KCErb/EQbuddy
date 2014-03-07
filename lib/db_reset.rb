#encoding: utf-8
$DIR = File.expand_path File.dirname(__FILE__)

require 'active_record'

File.delete($DIR + '/eqbuddy.db') if File.file?($DIR + '/eqbuddy.db')

ActiveRecord::Base.logger = Logger.new(File.open($DIR + '/eqb_db.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter  => 'jdbcsqlite3',
  :database => $DIR + '/eqbuddy.db'
)

require_relative 'schema'
require_relative 'relations'

ward = Ward.create(ward_number: '2168', stake_number: '1')
user = User.create(name: 'KC Erb', calling: 'eqp')

user.ward = ward
#Members
kc =      Member.create( last_name: 'Erb', pref_name: 'KC', gender: 'Male', phone: '8015548253',
                         email: 'iamkcerb@gmail.com', home_teaches?: true, dob: Date.new(1988,4,28) )
shelyse = Member.create( last_name: 'Hardy', pref_name: 'Shelyse', gender: 'Female', phone: '8015548253',
                         home_teaches?: true, dob: Date.new(1991,3,17))
audrey =  Member.create( last_name: 'Erb', pref_name: 'Audrey', gender: 'Female', home_teaches?: false, dob: Date.new(2014,1,28))
oliver =  Member.create( last_name: 'Prögler', pref_name: 'Oliver', gender: 'Male', email: 'iamkcerb@gmail.com',
                         home_teaches?: true, dob: Date.new(1972,07,01))
cory =    Member.create( last_name: 'Erb', pref_name: 'Cory', gender: 'Male', phone: '8015548253', email: 'iamkcerb@gmail.com',
                         home_teaches?: true, image_id: 't200jmj99', dob: Date.new(1988,4,28))
sharlie = Member.create( last_name: 'Erb', pref_name: 'Sharlie', gender: 'Female', email: 'iamkcerb@gmail.com',
                         home_teaches?: false, dob: Date.new(1988,3,4))
adele =   Member.create( last_name: 'Erb', pref_name: 'Adele', gender: 'Female', home_teaches?: false, dob: Date.new(2013,05,26))
mildred = Member.create( last_name: 'Tucker', pref_name: 'Mildred', gender: 'Female', home_teaches?: false, dob: Date.new(1938,12,22))
james =   Member.create( last_name: 'Hall', pref_name: 'James', gender: 'Male', phone: '8015548253',
                         email: 'iamkcerb@gmail.com', home_teaches?: true, dob: Date.new(1987,9,21))
caitlyn = Member.create( last_name: 'Hall', pref_name: 'Caitlyn', gender: 'Female', phone: '8015548253', 
                         home_teaches?: false, dob: Date.new(1985,7,11))
bryce =   Member.create( last_name: 'Ward', pref_name: 'Bryce', gender: 'Male', phone: '8015548253', 
                         home_teaches?: true, dob: Date.new(1983,9,23))
dianne =  Member.create( last_name: 'Ward', pref_name: 'Dianne', other_names: 'Ruth', gender: 'Female', 
                         email: 'iamkcerb@gmail.com', home_teaches?: false, dob: Date.new(1984,3,1))

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


#Connect members to households, and eachother
erb_hardy.heads << [kc, shelyse]
erb_hardy.children << [audrey]
erbs.heads << [cory, sharlie]
erbs.children << [adele]
progler.heads << [oliver]
tucker.heads << [mildred]
halls.heads << [james, caitlyn]
wards.heads << [bryce, dianne]

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

a1.teachers << [cory, oliver]
a1.teachees << [erb_hardy, halls, wards]

a2.teachers << [kc, james, bryce]
a2.teachees << [erbs, progler]


a3.teachers << [cory, oliver]
a3.teachees << [erb_hardy]

a4.teachers << [kc, bryce]
a4.teachees << [erbs, progler]

a5.teachers << [kc, shelyse]
a5.teachees << [wards]

#Assign HHs to Ward
[erbs, erb_hardy, progler, tucker, halls, wards].each do |household|
  household.ward = ward
end
