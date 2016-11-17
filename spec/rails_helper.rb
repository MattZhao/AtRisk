require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'support/controller_macros'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerMacros, type: :controller
end