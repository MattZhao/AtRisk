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
    id = params[:id] # retrieve form ID from URI route
    @form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @form.id_user != current_user.id.to_s
      return redirect_to '/messages/no_access'
    end

    if @form.form_type == 'AtRisk'
      return render 'show_atrisk'
    elsif @form.form_type == 'Autism'
      return render 'show_autism'
    end
    
    # form type doesn't match
    redirect_to '/messages/something_wrong'
  end
  
  def new
    if params[:form_type] == 'AtRisk'
      render 'new_atrisk'
    elsif params[:form_type] == 'Autism'
      render 'new_autism'
    end
  end
  
  def create
    @form = Form.create(form_params)
    @form.id_user = current_user.id.to_s
    @form.form_activeness = true
    if @form.save!
      flash[:notice] = "Successfully Created Form for #{@form.name}"
    else
      flash[:warning] = "Error: cannot create form"
    end
    redirect_to forms_path
  end
  
  def update
    @form = Form.find(params[:id])
    if @form.id_user != current_user.id.to_s
      return redirect_to '/messages/no_access'
    end
    
    @form.update_attributes!(form_params)
    flash[:notice] = "The information for #{@form.name} is successfully updated"
    redirect_to form_path(@form.id)
  end
  
  def destroy
    @form = Form.find(params[:id])
    if @form.id_user != current_user.id.to_s
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
    if @form.id_user != current_user.id.to_s
      return redirect_to '/messages/no_access'
    end
    
    if @form.form_type == 'AtRisk'
      return render 'edit_atrisk'
    elsif @form.form_type == 'Autism'
      return render 'edit_autism'
    end
    
    # form type doesn't match
    redirect_to '/messages/something_wrong'
  end

  def destroy
    @form = Form.find(params[:id])
    @form.form_activeness = false
    flash[:notice] = "Form was deleted."
    redirect_to forms_path
  end

end
