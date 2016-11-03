# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
forms = [{:name => 'Aladdin', :form_type => 'atrisk', :sex => 'Male', :birth_date => '25-Nov-1992', :has_alzheimers => true, :id_user => 1}, {:name => 'Banana', :form_type => 'atrisk', :sex => 'Male', :birth_date => '25-Nov-1992', :has_alzheimers => true, :id_user => 2}]

forms.each do |form|
  Form.create!(form)
end

default_user = {:email => 'default@user.com', :name => 'anonymous', :phone => '666', :password => '111111', :password_confirmation => '111111'}
User.create! default_user