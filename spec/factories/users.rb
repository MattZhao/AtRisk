# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    phone '555555555'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
    admin false
  end
  factory :admin, class: User do
    name 'Test Admin'
    email 'admin@atrisk.com'
    password 'admin_atrisk'
    password_confirmation 'admin_atrisk'
    phone '555555559'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
    admin true
  end

end