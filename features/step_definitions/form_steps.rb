# Add a declarative step here for populating the DB with forms.
Given /the following forms exist/ do |forms_table|
  forms_table.hashes.each do |form|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Form.create form 
  end
end

# click link in table does not work
When(/^I goooo to info page for the first item in database$/) do
  visit 'forms/1'
end

# # confirm delete form
# When(/^I accept the alart$/) do
#   page.accept_confirm
# end
