class FormsController < ApplicationController
  
  def form_params
    params.require(:form).permit! # permit all attributes
  end
  
  # test, you can delete this
  def index
    @forms = Form.all
  end
  
  def show
    id = params[:id] # retrieve form ID from URI route
    @form = Form.find(id) # look up form by unique ID
    # will render app/views/forms/show.<extension> by default ???? <== need to test this
  end
  
  def create
    @movie = Movie.create!(form_params)
    flash[:notice] = "form was successfully create for #{@form.name}"
    redirect_to forms_path
  end

end