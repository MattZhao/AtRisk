class FormsController < ApplicationController
  
  # check request validaty
  before_action :authenticate_user!
  
  def form_params
    params.require(:form).permit! # permit all attributes
  end
  
  # test, you can delete this
  def index
    @forms = Form.all
  end
  
  def show
    @currentUser = current_user.id
    id = params[:id] # retrieve form ID from URI route
    @get_form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @get_form.id_user == @currentUser
      @form = @get_form
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
