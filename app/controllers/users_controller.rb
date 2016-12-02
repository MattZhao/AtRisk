class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
      if not current_user.admin?
        flash[:warning] = "Error: you are not an administrator of the site."
        redirect_to forms_path
      else
        @selected_users = User.where(admin: false).where.not(confirmed_at: nil)
        sort = params[:order] || session[:order]
        case sort
          when 'name'
            ordering, @name_header = {:name => :asc}, 'hilite'
          when 'phone'
            ordering, @phone_header = {:phone => :asc}, 'hilite'
          when 'email'
            ordering, @email_header = {:email=> :asc}, 'hilite'
          when 'last_sign_in_at'
            ordering, @last_sign_in_at_header = {:last_sign_in_at => :desc}, 'hilite'
          when 'id'
            ordering, @id_header = {:id => :asc}, 'hilite'
        end
    
        if params[:order] != session[:order]
          session[:order] = sort
          redirect_to :order => sort and return
        end
        @selected_users = @selected_users.order(ordering)
      end
    end
end