require 'spec_helper'

describe GoogleFormsController do

  def mock_google_form(stubs={})
    @mock_google_form ||= mock_model(GoogleForm, stubs)
  end

  describe "GET index" do
    it "assigns all google_forms as @google_forms" do
      GoogleForm.stub(:find).with(:all).and_return([mock_google_form])
      get :index
      assigns[:google_forms].should == [mock_google_form]
    end
  end

  describe "GET show" do
    it "assigns the requested google_form as @google_form" do
      GoogleForm.stub(:find).with("37").and_return(mock_google_form)
      get :show, :id => "37"
      assigns[:google_form].should equal(mock_google_form)
    end
  end

  describe "GET new" do
    it "assigns a new google_form as @google_form" do
      GoogleForm.stub(:new).and_return(mock_google_form)
      get :new
      assigns[:google_form].should equal(mock_google_form)
    end
  end

  describe "GET edit" do
    it "assigns the requested google_form as @google_form" do
      GoogleForm.stub(:find).with("37").and_return(mock_google_form)
      get :edit, :id => "37"
      assigns[:google_form].should equal(mock_google_form)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created google_form as @google_form" do
        GoogleForm.stub(:new).with({'these' => 'params'}).and_return(mock_google_form(:save => true))
        post :create, :google_form => {:these => 'params'}
        assigns[:google_form].should equal(mock_google_form)
      end

      it "redirects to the created google_form" do
        GoogleForm.stub(:new).and_return(mock_google_form(:save => true))
        post :create, :google_form => {}
        response.should redirect_to(google_form_url(mock_google_form))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved google_form as @google_form" do
        GoogleForm.stub(:new).with({'these' => 'params'}).and_return(mock_google_form(:save => false))
        post :create, :google_form => {:these => 'params'}
        assigns[:google_form].should equal(mock_google_form)
      end

      it "re-renders the 'new' template" do
        GoogleForm.stub(:new).and_return(mock_google_form(:save => false))
        post :create, :google_form => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested google_form" do
        GoogleForm.should_receive(:find).with("37").and_return(mock_google_form)
        mock_google_form.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :google_form => {:these => 'params'}
      end

      it "assigns the requested google_form as @google_form" do
        GoogleForm.stub(:find).and_return(mock_google_form(:update_attributes => true))
        put :update, :id => "1"
        assigns[:google_form].should equal(mock_google_form)
      end

      it "redirects to the google_form" do
        GoogleForm.stub(:find).and_return(mock_google_form(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(google_form_url(mock_google_form))
      end
    end

    describe "with invalid params" do
      it "updates the requested google_form" do
        GoogleForm.should_receive(:find).with("37").and_return(mock_google_form)
        mock_google_form.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :google_form => {:these => 'params'}
      end

      it "assigns the google_form as @google_form" do
        GoogleForm.stub(:find).and_return(mock_google_form(:update_attributes => false))
        put :update, :id => "1"
        assigns[:google_form].should equal(mock_google_form)
      end

      it "re-renders the 'edit' template" do
        GoogleForm.stub(:find).and_return(mock_google_form(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested google_form" do
      GoogleForm.should_receive(:find).with("37").and_return(mock_google_form)
      mock_google_form.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the google_forms list" do
      GoogleForm.stub(:find).and_return(mock_google_form(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(google_forms_url)
    end
  end

end
