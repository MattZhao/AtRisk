class FormsController < ApplicationController
  
  # check request validaty
  before_action :authenticate_user!
  before_filter :check_for_cancel, :only => [:create, :update]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to forms_path
    end
  end

  def form_params
    params.require(:form).permit! # permit all form attributes
  end

  def index
    # this functions as the user dashboard for now
    
    @order = params[:order]
    @form_filter = params[:type]
    if params[:search]
      print("searching!")
      print(params[:search])
      @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).search(params[:search])
    else
      if @order == "name"
        session[:order] = @order
        if @form_filter != nil
          @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).order(:name)
          @my_forms = @my_forms.select { |form| @form_filter.key?(form.form_type) }
        else
          @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).order(:name)
        end
      elsif @order == "birth_date"
        session[:order] = @order
        if @form_filter != nil
          @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).order(:birth_date)
          @my_forms = @my_forms.select { |form| @form_filter.key?(form.form_type) }
        else
          @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).order(:birth_date)
        end
      else
        @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true)
        if @form_filter != nil
          @my_forms = @my_forms.select { |form| @form_filter.key?(form.form_type) }
        #elsif @form_filter == nil
          #@my_forms = {}
        end
      end
    end
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
    
    if @form.form_type == "AtRisk" and @form.other_disorders != ""
      @form.has_other_disorders = true
    else
      @form.has_other_disorders = false
    end
    
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
