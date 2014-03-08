ActiveRecord::Schema.define do

  create_table :action_items do |table|
    table.integer :user_id
    table.string :description
    table.date :expires
  end

  create_table :assigned_teachees do |table|
    table.integer :assignment_id
    table.integer :household_id
  end

  create_table :assigned_teachers do |table|
    table.integer :assignment_id
    table.integer :member_id
  end

  create_table :assignments do |table|
    table.integer :district_id
    table.integer :month
  end

  create_table :attendance_records do |table|
    table.integer :member_id
    table.integer :month
    table.integer :percent
  end

  create_table :districts do |table|
    table.integer :district_leader_id
  end

  create_table :households do |table|
    table.string :ward_id
    
    table.string :house_name
    table.string :add1
    table.string :add2
    table.decimal :latitude
    table.decimal :longitude
    table.string :phone
    table.string :email
    table.boolean :home_taught?
    table.string :image_id
    table.date :move_in
    table.date :move_out
  end

  create_table :household_tags do |table|
    table.integer :household_id
    table.integer :tag_id
  end

  create_table :members do |table|
    table.integer :household_id
    table.integer :house_id
    table.integer :district_id
    table.integer :spouse_id

    table.string :last_name
    table.string :pref_name
    table.string :other_names
    table.string :gender
    table.string :phone
    table.string :email
    table.string :home_teaches?
    table.string :image_id
    table.datetime :last_sync
    table.string   :last_email
    table.date     :dob
  end

  create_table :notes do |table|
    table.integer :household_id
    table.date :date
    table.string :description
  end

  create_table :settings do |table|
    table.integer :user_id
    table.boolean :use_voice?
    table.boolean :use_gmail?
    table.string :teach_self    #Disallow, allow, warn
    table.string :teach_comp    #Disallow, allow, warn
    table.string :teach_teacher #Disallow, allow, warn

  end

  create_table :taught_records do |table|
    table.integer :household_id
    table.integer :month
    table.integer :score
  end

  create_table :teach_records do |table|
    table.integer :member_id
    table.integer :month
    table.decimal :score
  end

  create_table :tags do |table|
    table.string :name
  end

  create_table :users do |table|
    table.integer :ward_id
    table.string :name
    table.string :calling
  end

  create_table :wards do |table|
    table.string :ward_number
    table.string :stake_number
  end

end
