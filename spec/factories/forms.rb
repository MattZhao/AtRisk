# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :form do
    name 'Test form'
    form_activeness true
  end
end