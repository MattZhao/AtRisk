require 'spec_helper'

describe FormsController do
  
  describe "A successful show" do
    it 'should find the form and show it' do
      form = double('form', :type => "Autism")
      Form.should_receive(:find).with('1').and_return(form)
      get :show, {:id => '1'}
      response.should redirect_to(forms#show_atrisk)
     end
  end
  
  describe "A successful create" do
    it 'should create a form' do
      form2 = double('another')
      Form.should_receive(:create!).and_return(form2)
      post :create, :form => form2
      response.should redirect_to(form_path)
    end
  end
  
  describe "A successful update" do
  end
  
  describe "A successful destroy" do
  end

  describe "A successful edit" do
  end
end