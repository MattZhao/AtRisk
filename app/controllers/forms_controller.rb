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
    @all_active = Form.all_active
    @selected_types = params[:types] || session[:types] || {}
    @selected_activeness = params[:activeness] || session[:activeness] || {}
    
    # search overrules all
    if params[:search] != nil and params[:search] != ""
      if current_user.admin
        @my_forms = Form.search(params[:search])
      else
        @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true).search(params[:search])
      end
      @search_active_msg = "Search Results (press reload to go back)"
      return
    end
    
    sort = params[:order] || session[:order]
    case sort
      when 'name'
        ordering, @name_header = {:name => :asc}, 'hilite'
      when 'birth_date'
        ordering, @birth_date_header = {:birth_date => :asc}, 'hilite'
      when 'created_at'
        ordering, @created_at_header = {:created_at => :asc}, 'hilite'
      when 'updated_at'
        ordering, @updated_at_header = {:updated_at => :asc}, 'hilite'
    end
    
    if @selected_types == {}
      @selected_types = Hash[@all_types.map {|type| [type, type]}]
      @selected_activeness = Hash[@all_active.map {|activeness| [activeness, activeness]}]
    end
    
    if params[:order] != session[:order] or params[:types] != session[:types] or params[:activeness] != session[:activeness]
      session[:order] = sort
      session[:types] = @selected_types
      session[:activeness] = @selected_activeness
      redirect_to :order => sort, :types => @selected_types, :activeness => @selected_activeness and return
    end
    if current_user.admin
      if @selected_activeness.keys.include?('Active') && @selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys).order(ordering)
      elsif @selected_activeness.keys.include?('Active') && !@selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys, :form_activeness => true).order(ordering)
      elsif !@selected_activeness.keys.include?('Active') && @selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys, :form_activeness => false).order(ordering)
      end
    else
      @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true, form_type: @selected_types.keys).order(ordering)
    end
  end

  def show
    id = params[:id] # retrieve form ID from URI route
    if not Form.exists?(id)
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @form.id_user != current_user.id.to_s and !current_user.admin
      flash[:warning] = "Error: you are not the owner of this form."
      return redirect_to forms_path
    end
    
    if not @form.form_activeness and !current_user.admin
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
    if @form.id_user != current_user.id.to_s and !current_user.admin
      return redirect_to '/messages/no_access'
    end
    
    @form.update_attributes!(form_params)
    flash[:notice] = "The information for #{@form.name} is successfully updated"
    redirect_to form_path(@form.id)
  end
  
  def destroy
    @form = Form.find(params[:id])
    if @form.id_user != current_user.id.to_s and !current_user.admin
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
  
  def revive
    @form = Form.find(params[:id])
    if !current_user.admin
      return redirect_to '/messages/no_access'
    end
    
    @form.form_activeness = true
    if @form.save!
      flash[:notice] = "Form for #{@form.name} is now visible to the owner"
    else
      flash[:warning] = "Error: form could not be revived"
    end
    redirect_to form_path(@form.id)
  end
  
  def hard_delete
    @form = Form.find(params[:id])
    if !current_user.admin
      return redirect_to '/messages/no_access'
    end
    
    last_glimpse = @form.name
    Form.destroy(params[:id])
    flash[:notice] = "Form for #{last_glimpse} is permanently deleted"
    redirect_to forms_path
  end
  
  def edit
    id = params[:id] # retrieve form ID from URI route
    if not Form.exists?(id)
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
    
    # check user validaty
    if @form.id_user != current_user.id.to_s and !current_user.admin
      flash[:warning] = "Error: you are not the owner of this form."
      return redirect_to forms_path
    end
    
    if not @form.form_activeness and !current_user.admin
      flash[:warning] = "Error: invalid address."
      return redirect_to forms_path
    end

    @form = Form.find(params[:id])
    if @form.id_user != current_user.id.to_s and !current_user.admin
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
