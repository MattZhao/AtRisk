class AtRiskController < ApplicationController
  
  before_action :authenticate_user!, only: [] # todo: add your action here if it requires login
  
  def index
    if user_signed_in?
      redirect_to user_dashboard_path(current_user.id) # todo: routes user_dashboard
    end
  end

  def show
    id = params[:id] # retrieve form ID from URI route
    @form = Form.find(id) # look up form by unique ID
    # will render app/views/forms/show.<extension> by default ???? <== need to test this
  end

end