# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    when /the sign up page/
      '/users/sign_up'

    when /the sign in page/
      '/users/sign_in'

    when /^the user dashboard page$/
      '/forms'
    
    when /^the new At-Risk form page/
      '/forms/new?form_type=AtRisk'
    
    when /^the new Autism form page/
      '/forms/new?form_type=Autism'

    when /^the info page for "(.*)"$/i
      form_path(Form.find_by_name($1))

    when /^the edit page for "(.*)"$/i
      edit_form_path(Form.find_by_name($1))
      
    when /^the file uploading test page$/i
      pending


    # original codes
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
