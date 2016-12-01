### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "password", :password_confirmation => "password", :phone => "1234567890" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def create_user_2
  @visitor2 = { :name => "Holy Cow", :email => "aaa@example.com", :phone => "1234567890",
    :password => "ppppppppp", :password_confirmation => "ppppppppp", :id => "2"}
  @user2 = FactoryGirl.create(:user, @visitor2)
end

def create_user_admin
  @visitor_admin = { :name => "ADMIN", :email => "admin@atrisk.com", :phone => "1234567890",
    :password => "admin_atrisk", :password_confirmation => "admin_atrisk", :admin => "true"}
  @user = FactoryGirl.create(:user, @visitor_admin)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  fill_in "user_phone", :with => @visitor[:phone]
  click_button "Sign Up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Log In"
end

def sign_in_2
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor2[:email]
  fill_in "user_password", :with => @visitor2[:password]
  click_button "Log In"
end

def sign_in_admin
  visit '/users/sign_in'
  fill_in "user_email", :with => "admin@atrisk.com"
  fill_in "user_password", :with => "admin_atrisk"
  click_button "Log In"
end

### Iter 2 UPDATE ###
def create_visitor_with_mandatory_data
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "password", :password_confirmation => "password",
    :phone => "1234567890"}
end

def sign_up_with_mandatory_data
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  fill_in "user_phone", :with => @visitor[:phone]
  click_button "Sign Up"
  find_user
end

When /^I sign up with mandatory user data$/ do
  create_visitor_with_mandatory_data
  sign_up_with_mandatory_data
end

When /^I edit my phone number$/ do
  click_link "Edit Account"
  fill_in "phone_number", :with => "0987654321"
  fill_in "user_current_password", :with => @visitor[:password]
end


### GIVEN ###
Given /^I am not logged in$/ do
  page.driver.delete('/users/sign_out')
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I am loggedin as user_two$/ do
  create_user_2
  sign_in_2
end

Given /^I am logged in as admin$/ do
  create_user_admin
  sign_in_admin
end

# And /^there are two users$/ do
#   create_user_1
#   create_user_2
# end

# And /^I am loggedin as the first_user$/ do
#   sign_up
#   sign_in
# end
  

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  page.driver.delete('/users/sign_out')
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When(/^I save the edit form$/) do
  click_button "Update"
end

When /^I edit my account name$/ do
  click_link "Edit Account"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
end

When /^I edit my email address$/ do
  click_link "Edit Account"
  fill_in "user_email", :with => "newemail@example.com"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I don't enter my current password$/) do
  fill_in "user_current_password", :with => ""
end

When(/^I edit my email address with an invalid email$/) do
  click_link "Edit Account"
  fill_in "user_email", :with => "notanemail"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password$/) do
  click_link "Edit Account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password with missing confirmation$/) do
  click_link "Edit Account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password with missmatched confirmation$/) do
  click_link "Edit Account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword123"
  fill_in "user_current_password", :with => @visitor[:password]
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Register"
  page.should_not have_content "Log In"
end

Then /^I should be signed out$/ do
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password confirmation doesn't match"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password confirmation doesn't match"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid Email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "Your account has been updated successfully."
end

Then(/^I should see a current password missing message$/) do
  page.should have_content "Current password can't be blank"
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end