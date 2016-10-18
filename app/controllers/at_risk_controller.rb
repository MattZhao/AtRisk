class AtRiskController < ApplicationController
  def index
  end
    
  def form_params
  #params.require(#include all non-optional params here)
  end
    
  def create
    @form = Form.create!(form_params)
    flash[:notice] = 'Your form is submitted'
    redirect_to forms_path
  end
    
  def edit
    @form = Form.find params[:id]
  end
  
end
