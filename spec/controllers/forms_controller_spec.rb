require 'spec_helper'
require "rails_helper"


describe FormsController do
  include Devise::Test::ControllerHelpers

  before :each do        
      @user=create(:user)
      sign_in @user
  end

  describe "A successful show" do

    it 'should find the form and show it' do
      form = double(:form)
      get :show, id: form
    end
  end

  describe "Index" do
    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
    
    # it "populates the users forms if nothing is specified" do
    #   Form.should_receive(:where)
    #   get :index
    # end
    
    it "calls search when necessary" do
      Form.should_receive(:search)
      get :index, :search => 'a'
    end
    
    
  end

  describe "A successful create" do
    # it 'should create a form' do
    #   form2 = double('another', :type => "Autism")
    #   Form.should_receive(:create!).and_return(form2)
    #   post :create, :form => form2, {
    #   response.should redirect_to(form_path)
    # end
  end
  
  describe "A successful update" do
    # it 'should update a form' do
    #   formU = double("formu", :id => '1')
    #   expect(Form).to receive(:find).with('1')
    #   get :edit, {:id => '1'}
    #   get :update, {:id => '1'}
    # end
  end
  
  describe "A successful destroy" do
  end

  describe "A successful edit" do
  end
end