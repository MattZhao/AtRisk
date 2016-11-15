class FormsController < ApplicationController
  
  # check request validaty
  before_action :authenticate_user!
  before_action :find_form, :only => [:show, :update, :destroy, :revive, :hard_delete, :edit]
  before_filter :check_for_cancel, :only => [:create, :update]
      
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
    
    if params[:order] != session[:order] or params[:types] != session[:types]
      session[:order] = sort
      session[:types] = @selected_types
      session[:activeness] = params[:activeness]
      redirect_to :order => sort, :types => @selected_types, :activeness => @selected_activeness and return
    end
    
    if current_user.admin
      if @selected_activeness.keys.include?('Active') && @selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys).order(ordering)
      elsif @selected_activeness.keys.include?('Active') && !@selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys, :form_activeness => true).order(ordering)
      elsif !@selected_activeness.keys.include?('Active') && @selected_activeness.keys.include?('Inactive')
        @my_forms = Form.where(form_type: @selected_types.keys, :form_activeness => false).order(ordering)
      else
        @my_forms = Form.where(form_type: @selected_types.keys).order(ordering)
        session[:activeness] = {'Active' => 1, 'Inactive' => 1}
      end
    else
      @my_forms = Form.where(:id_user => current_user.id.to_s, :form_activeness => true, form_type: @selected_types.keys).order(ordering)
    end
  end

  def generate_pdf
    id = params[:id] # retrieve form ID from URI route
    if not Form.exists?(id)
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  def show
<<<<<<< HEAD
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
      respond_to do |format|
        format.html do
          check_owner_and_address
          render 'show_atrisk'
        end
        
        format.pdf do
          # render :pdf => "#{@form.name} AtRisk Form",
          @pdf = render_to_string :pdf => "#{@form.name} AtRisk Form",
            :encoding => "UTF-8",
            :template => 'forms/pdf_atrisk.html.haml',
          # :save_to_file => Rails.root.join('pdfs', "#{filename}.pdf"),
          # :save_only: => false,
            :show_as_html => params[:debug].present?, 
            :title => "The AtRisk Form for #{@form.name}",
            :font_name => 'Times',
  
            :header => {
              right: 'Orinda Police Depertment',
              font_name: 'Times',
              # font_size: SIZE,
            },
            
            :margin => {
          		top: 20,
          		bottom: 15, 
          		left: 15, 
          		right: 20
            	}
          send_data(@pdf, :filename => "#{@form.name} AtRisk Form.pdf",  :type=>"application/pdf")

        end
      end
      
      
      
    elsif @form.form_type == 'Autism'
      respond_to do |format|
        format.html do
          check_owner_and_address
          render 'show_autism'
        end
        
        format.pdf do
          @pdf = render_to_string :pdf => "#{@form.name} AtRisk Form",
            :encoding => "UTF-8",
            :template => 'forms/pdf_atrisk.html.haml',
            :show_as_html => params[:debug].present?, 
            :title => "The Autism Form for #{@form.name}",
            :font_name => 'Times',
  
            :header => {
              right: 'Orinda Police Depertment',
              font_name: 'Times',
              # font_size: SIZE,
            },
            
            :margin => {
          		top: 20,
          		bottom: 15, 
          		left: 15, 
          		right: 20
            	}
          send_data(@pdf, :filename => "#{@form.name} Autism Form.pdf",  :type=>"application/pdf")
        end
      end
    end
  end 
  

  def edit
    check_owner_and_address
    if @form.id_user != current_user.id.to_s and !current_user.admin
      return redirect_to '/messages/no_access'
    end
    render_page('edit')
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

  def new
    if params[:form_type] == 'AtRisk'
      render 'new_atrisk'
    elsif params[:form_type] == 'Autism'
      render 'new_autism'
    end
  end
  
  def update
    if @form.id_user != current_user.id.to_s and !current_user.admin
      return redirect_to '/messages/no_access'
    end
    
    @form.update_attributes!(form_params)
    flash[:notice] = "The information for #{@form.name} is successfully updated"
    redirect_to form_path(@form.id)
  end
  
  def destroy
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
    check_admin
    @form.form_activeness = true
    if @form.save!
      flash[:notice] = "Form for #{@form.name} is now visible to the owner"
    else
      flash[:warning] = "Error: form could not be revived"
    end
    redirect_to form_path(@form.id)
  end
  
  def hard_delete
    check_admin
    last_glimpse = @form.name
    Form.destroy(params[:id])
    flash[:notice] = "Form for #{last_glimpse} is permanently deleted"
    redirect_to forms_path
  end
  
  private
  
  # check if cancel for create & update
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to forms_path
    end
  end
  
  def form_params
    params.require(:form).permit! # permit all form attributes
  end
  
  # validate id corresponds to valid form and assign to @form
  def find_form
    id = params[:id] # retrieve form ID from URI route
    if not Form.where("id = ?", id).exists?
      return redirect_to '/messages/invalid_page'
    end
    @form = Form.find(id) # look up form by unique ID
  end
  
  # check if current user is admin, direct to no_access page if not admin
  # important for operations on users table
  def check_admin
    if !current_user.admin?
      return redirect_to '/messages/no_access'
    end
  end
  
  # render page for "show" or "edit" or something_wrong page
  def render_page(flag)
    if @form.form_type == 'AtRisk'
      return render flag + '_atrisk'
    elsif @form.form_type == 'Autism'
      return render flag + '_autism'
    else
      redirect_to '/messages/something_wrong'
    end
  end

  # helper for 'show' & 'edit'
  def check_owner_and_address
    if @form.id_user != current_user.id.to_s and !current_user.admin
      flash[:warning] = "Error: you are not the owner of this form."
      return redirect_to forms_path
    end
    
    if not @form.form_activeness and !current_user.admin
      flash[:warning] = "Error: invalid address."
      return redirect_to forms_path
    end

    if @form.id_user != current_user.id.to_s and !current_user.admin
      return redirect_to '/messages/no_access'
    end
  end

end
