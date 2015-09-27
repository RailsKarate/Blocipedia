require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:valid_attributes) {
    skip("title" => "My title", "body" => "My body example", "private" => false)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WikisController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let!(:user) { create(:user) }

   before do
    login_as(user)
   end

  describe "GET #index" do
    context "logged in" do 
      it "assigns all wikis the user as @wikis" do
        wiki = user.wikis.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:wikis)).to eq([wiki])
        expect(assigns(:wikis).map(&:user)).to eq([user])
      end

       it "does not load other user's wikis" do
        other_wiki = Wiki.create!(valid_attributes.merge(user_id: create(:user).id))
        get :index, {}, valid_session
        expect(assigns(:wikis)).to_not include(other_wiki)
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested wiki as @wiki" do
      wiki = Wiki.create! valid_attributes
      get :show, {:id => wiki.to_param}, valid_session
      expect(assigns(:wiki)).to eq(wiki)
    end
  end

  describe "GET #new" do
    it "assigns a new wiki as @wiki" do
      wiki = user.wikis.create! valid_attributes
      get :new, {}, valid_session
      expect(assigns(:wiki)).to be_a_new(Wiki)
      expect(assigns(:wiki).user).to eq(user)
    end
  end

  describe "GET #edit" do
    it "assigns the requested wiki as @wiki" do
      wiki = user.wikis.create! valid_attributes
      get :edit, {:id => wiki.to_param}, valid_session
      expect(assigns(:wiki)).to eq(wiki)
      expect(assigns(:wiki).user).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Wiki" do
        expect {
          post :create, {:wiki => valid_attributes}, valid_session
        }.to change(Wiki, :count).by(1)
      end

      it "assigns a newly created wiki as @wiki" do
        post :create, {:wiki => valid_attributes}, valid_session
        expect(assigns(:wiki)).to be_a(Wiki)
        expect(assigns(:wiki)).to be_persisted
      end

      it "redirects to the created wiki" do
        post :create, {:wiki => valid_attributes}, valid_session
        expect(response).to redirect_to(Wiki.last)
      end

      it "creates a wiki for the current user" do
        post :create, {:wiki => valid_attributes}, valid_session
        todo_list = Wiki.last
        expect(wiki.user).to eq(user)
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved wiki as @wiki" do
        post :create, {:wiki => invalid_attributes}, valid_session
        expect(assigns(:wiki)).to be_a_new(Wiki)
      end

      it "re-renders the 'new' template" do
        post :create, {:wiki => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested wiki" do
        wiki = user.wikis.create! valid_attributes
        put :update, {:id => wiki.to_param, :wiki => new_attributes}, valid_session
        wiki.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested wiki as @wiki" do
        wiki = user.wikis.create! valid_attributes
        put :update, {:id => wiki.to_param, :wiki => valid_attributes}, valid_session
        expect(assigns(:wiki)).to eq(wiki)
      end

      it "redirects to the wiki" do
        wiki = user.wikis.create! valid_attributes
        put :update, {:id => wiki.to_param, :wiki => valid_attributes}, valid_session
        expect(response).to redirect_to(wiki)
      end
    end

    context "with invalid params" do
      it "assigns the wiki as @wiki" do
        wiki = user.wikis.create! valid_attributes
        put :update, {:id => wiki.to_param, :wiki => invalid_attributes}, valid_session
        expect(assigns(:wiki)).to eq(wiki)
      end

      it "re-renders the 'edit' template" do
        wiki = user.wikis.create! valid_attributes
        put :update, {:id => wiki.to_param, :wiki => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested wiki" do
      wiki = user.wikis.create! valid_attributes
      expect {
        delete :destroy, {:id => wiki.to_param}, valid_session
      }.to change(Wiki, :count).by(-1)
    end

    it "redirects to the wikis list" do
      wiki = user.wikis.create! valid_attributes
      delete :destroy, {:id => wiki.to_param}, valid_session
      expect(response).to redirect_to(wikis_url)
    end
  end

end
