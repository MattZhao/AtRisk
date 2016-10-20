class FormsController < ApplicationController
  
  # check request validaty
  before_action :authenticate_user!
  
  def form_params
    params.require(:form).permit! # permit all form attributes
  end

  def index
    # this functinos as the user dashboard for now
    @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true)
  end
  
  def show
    @currentUser = current_user.id
    id = params[:id] # retrieve form ID from URI route
    @get_form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @get_form.id_user == @currentUser.to_s
      @form = @get_form
    else
      redirect_to '/messages/no_access'
    end
    
    # will render app/views/forms/show.<extension> by default if user is valid
  end

  def new
    # default: render 'new' template
  end
  
  def create
    @form = Form.create(form_params)
    @form.id_user = current_user.id.to_s
    @form.form_activeness = true
    if @form.save!
      flash[:notice] = "Created form for #{@form.name}"
    else
      flash[:warning] = "Error: cannot create form"
    end
    redirect_to forms_path
  end
  
  def update
    @form = Form.find(params[:id])
    if @form.id_user != @currentUser.to_s
      return redirect_to '/messages/no_access'
    end
    
    @form.update_attributes!(form_params)
    flash[:notice] = "The information for #{@form.name} is successfully updated"
    redirect_to form_path(@form.id)
  end
  
  def destroy
    @form = Form.find(params[:id])
    if @form.id_user != @currentUser.to_s
      return redirect_to '/messages/no_access'
    end
    
    @form.form_activeness = false
    if @form.save!
      flash[:notice] = "Form for #{@form.name} is deleted"
    else
      flash[:warning] = "Error: form could not be deleted"
    end
    redirect_to forms_path
  end
  
  def edit
    @form = Form.find(params[:id])
    if @form.id_user != @currentUser.to_s
      return redirect_to '/messages/no_access'
    end
  end

end
