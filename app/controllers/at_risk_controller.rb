class AtRiskController < ApplicationController
    def index
    end
    
    def destroy
        @form = Form.find(params[:id])
        @form.form_activeness = false
        flash[:notice] = "Form was deleted."
        redirect_to forms_path
    end
end

