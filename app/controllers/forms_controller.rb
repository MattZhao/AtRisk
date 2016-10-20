class FormsController < ApplicationController
  
  # check request validaty
  before_action :authenticate_user!
  
  def form_params
    params.require(:form).permit! # permit all attributes
  end

  def index
    # this functinos as the user dashboard for now
    @my_forms = Form.where("id_user =" + current_user.id.to_s)
  end
  
  def show
    @currentUser = current_user.id
    id = params[:id] # retrieve form ID from URI route
    @get_form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @get_form.id_user == @currentUser
      @form = @get_form
    else
      redirect_to '/messages/no_access'
    end
    
    # will render app/views/forms/show.<extension> by default if user is valid
  end

  def create
    @form = Form.create!(form_params)
    flash[:notice] = "form was successfully create for #{@form.name}"
    redirect_to forms_path
  end
  
  def destroy
    @form = Form.find(params[:id])
    @form.form_activeness = false
    flash[:notice] = "Form was deleted."
    redirect_to forms_path
  end

end
