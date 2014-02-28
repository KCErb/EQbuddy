#File.delete("ments.db") if File.file?("ments.db")

ActiveRecord::Base.logger = Logger.new(File.open('eqb_db.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'eqbuddy.db'
)

ActiveRecord::Schema.define do

  create_table :wards do |table|
    table.string :ward_number
    table.string :stake_number
  end

  create_table :users do |table|
    table.integer :ward_id
    table.string :name
    table.string :calling
  end

  create_table :settings do |table|
    table.integer :user_id
    table.boolean :likes_cake?
  end

  create_table :action_items do |table|
    table.integer :user_id
    table.string :description
    table.datetime :expires
  end

  create_table :notes do |table|
    table.integer :household_id
    table.datetime :date
    table.string :description
  end

  create_table :tags do |table|
    table.string :name
  end

  create_table :household_tags do |table|
    table.integer :household_id
    table.integer :tag_id
  end

  create_table :taught_records do |table|
    table.integer :household_id
    table.integer :month
    table.integer :score
  end
  
  create_table :teach_records do |table|
    table.integer :member_id
    table.integer :month
    table.integer :score
  end

  create_table :attendance_records do |table|
    table.integer :member_id
    table.integer :month
    table.integer :percent
  end

  create_table :assignments do |table|
    table.integer :district_id
  end

  create_table :members do |table|
    table.integer :household_id
    table.integer :house_id
    table.integer :district_id
    table.integer :spouse_id
    table.string :name
    table.string :phone
  end

  create_table :households do |table|
    table.string :address
    table.string :ward_id
  end

  create_table :districts do |table|
    table.integer :district_leader_id
  end

  create_table :assigned_teachers do |table|
    table.integer :assignment_id
    table.integer :member_id
  end

  create_table :assigned_teachees do |table|
    table.integer :assignment_id
    table.integer :household_id
  end
end
