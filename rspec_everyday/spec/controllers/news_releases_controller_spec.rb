require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe NewsReleasesController do

  # This should return the minimal set of attributes required to create a valid
  # NewsRelease. As you add validations to NewsRelease, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NewsReleasesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all news_releases as @news_releases" do
      news_release = NewsRelease.create! valid_attributes
      get :index, {}, valid_session
      assigns(:news_releases).should eq([news_release])
    end
  end

  describe "GET show" do
    it "assigns the requested news_release as @news_release" do
      news_release = NewsRelease.create! valid_attributes
      get :show, {:id => news_release.to_param}, valid_session
      assigns(:news_release).should eq(news_release)
    end
  end

  describe "GET new" do
    it "assigns a new news_release as @news_release" do
      get :new, {}, valid_session
      assigns(:news_release).should be_a_new(NewsRelease)
    end
  end

  describe "GET edit" do
    it "assigns the requested news_release as @news_release" do
      news_release = NewsRelease.create! valid_attributes
      get :edit, {:id => news_release.to_param}, valid_session
      assigns(:news_release).should eq(news_release)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new NewsRelease" do
        expect {
          post :create, {:news_release => valid_attributes}, valid_session
        }.to change(NewsRelease, :count).by(1)
      end

      it "assigns a newly created news_release as @news_release" do
        post :create, {:news_release => valid_attributes}, valid_session
        assigns(:news_release).should be_a(NewsRelease)
        assigns(:news_release).should be_persisted
      end

      it "redirects to the created news_release" do
        post :create, {:news_release => valid_attributes}, valid_session
        response.should redirect_to(NewsRelease.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved news_release as @news_release" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsRelease.any_instance.stub(:save).and_return(false)
        post :create, {:news_release => { "title" => "invalid value" }}, valid_session
        assigns(:news_release).should be_a_new(NewsRelease)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsRelease.any_instance.stub(:save).and_return(false)
        post :create, {:news_release => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested news_release" do
        news_release = NewsRelease.create! valid_attributes
        # Assuming there are no other news_releases in the database, this
        # specifies that the NewsRelease created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        NewsRelease.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => news_release.to_param, :news_release => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested news_release as @news_release" do
        news_release = NewsRelease.create! valid_attributes
        put :update, {:id => news_release.to_param, :news_release => valid_attributes}, valid_session
        assigns(:news_release).should eq(news_release)
      end

      it "redirects to the news_release" do
        news_release = NewsRelease.create! valid_attributes
        put :update, {:id => news_release.to_param, :news_release => valid_attributes}, valid_session
        response.should redirect_to(news_release)
      end
    end

    describe "with invalid params" do
      it "assigns the news_release as @news_release" do
        news_release = NewsRelease.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsRelease.any_instance.stub(:save).and_return(false)
        put :update, {:id => news_release.to_param, :news_release => { "title" => "invalid value" }}, valid_session
        assigns(:news_release).should eq(news_release)
      end

      it "re-renders the 'edit' template" do
        news_release = NewsRelease.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsRelease.any_instance.stub(:save).and_return(false)
        put :update, {:id => news_release.to_param, :news_release => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested news_release" do
      news_release = NewsRelease.create! valid_attributes
      expect {
        delete :destroy, {:id => news_release.to_param}, valid_session
      }.to change(NewsRelease, :count).by(-1)
    end

    it "redirects to the news_releases list" do
      news_release = NewsRelease.create! valid_attributes
      delete :destroy, {:id => news_release.to_param}, valid_session
      response.should redirect_to(news_releases_url)
    end
  end

end
