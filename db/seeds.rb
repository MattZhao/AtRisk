# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# forms = [{:name => 'Aladdin', :form_type => 'atrisk', :sex => 'Male', :birth_date => '25-Nov-1992', :has_alzheimers => true, :id_user => 1}, {:name => 'Banana', :form_type => 'atrisk', :sex => 'Male', :birth_date => '25-Nov-1992', :has_alzheimers => true, :id_user => 2}]

# forms.each do |form|
#   Form.create!(form)
# end

users= [{:email => 'admin@atrisk.com', :name => 'admin', :phone => '1234567890', :password => 'admin_atrisk', :password_confirmation => 'admin_atrisk', :admin => true, :confirmed_at => '01/01/1990'},
        {:email => 'default@user.com', :name => 'anonymous', :phone => '666', :password => '111111', :password_confirmation => '111111', :confirmed_at => '01/01/1990'},
        ]

users.each do |user|
  User.create! user
end