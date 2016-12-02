class AtRiskController < ApplicationController
  before_action :authenticate_user!, only: [] # todo: add your action here if it requires login

  def index
    if user_signed_in?
      redirect_to forms_path # we are doing this for now, in the future may use good style (actual controller)
    end
  end
end