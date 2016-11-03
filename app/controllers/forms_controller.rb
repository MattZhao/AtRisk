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
    @search_active_msg = ""
    @all_types = Form.all_types
    @selected_types = params[:types] || session[:types] || {}
    
    # search overrules all
    if params[:search] != nil and params[:search] != ""
      @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).search(params[:search])
      @search_active_msg = "Search Results (press reload to go back)"
      return
    end
    
    sort = params[:order] || session[:order]
    case sort
      when 'name'
        ordering, @name_header = {:name => :asc}, 'hilite'
      when 'birth_date'
        ordering, @birth_date_header = {:birth_date => :asc}, 'hilite'
    end
    
    if @selected_types == {}
      @selected_types = Hash[@all_types.map {|type| [type, type]}]
    end
    
    if params[:order] != session[:order] or params[:types] != session[:types]
      session[:order] = sort
      session[:types] = @selected_types
      redirect_to :order => sort, :types => @selected_types and return
    end
    @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true, form_type: @selected_types.keys).order(ordering)
  end

  def show
    id = params[:id] # retrieve form ID from URI route
    if not Form.exists?(id)
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @form.id_user != current_user.id.to_s
      flash[:warning] = "Error: you are not the owner of this form."
      return redirect_to forms_path
    end
    
    if not @form.form_activeness
      flash[:warning] = "Error: invalid address."
      return redirect_to forms_path
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
    id = params[:id] # retrieve form ID from URI route
    if not Form.exists?(id)
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @form.id_user != current_user.id.to_s
      flash[:warning] = "Error: you are not the owner of this form."
      return redirect_to forms_path
    end
    
    if not @form.form_activeness
      flash[:warning] = "Error: invalid address."
      return redirect_to forms_path
    end

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

end
