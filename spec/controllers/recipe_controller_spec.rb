require "rails_helper"

describe RecipeController do
  describe "routing" do
    it "works" do
      expect(get: "/recipe").to route_to(controller: "recipe", action: "index")
      expect(get: "/new").to route_to(controller: "recipe", action: "new")
      expect(post: "/new").to route_to(controller: "recipe", action: "create")
      expect(get: "/11/edit").to route_to(controller: "recipe", action: "edit", id: "11")
      expect(patch: "/11/edit").to route_to(controller: "recipe", action: "update", id: "11")
      expect(get: "/11").to route_to(controller: "recipe", action: "show", id: "11")
      expect(delete: "/11/delete").to route_to(controller: "recipe", action: "delete", id: "11")
    end
  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    before do
      @user = User.create(email: "admin@peasbemine.de", password: "LetMeTestThis")
      sign_in @user
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns @recipe" do
      get :new
      expect(assigns[:recipe]).to be_a(Recipe)
    end
  end

  describe "#create" do
    before do
      @user = User.create(email: "admin@peasbemine.de", password: "LetMeTestThis")
      sign_in @user

      @recipe = Recipe.create(title: "Reis mit Pilzgulasch")
      expect(Recipe).to receive(:new).and_return(@recipe)
    end

    it "assigns @recipe" do
      post :create, params: { recipe: { title: "Reis mit Pilzgulasch" } }
      expect(assigns[:recipe]).to be_a(Recipe)
    end

    it "saves the recipe" do
      expect(@recipe).to receive(:save).and_return(true)
      post :create, params: { recipe: { title: "Reis mit Pilzgulasch" } }
    end

    it "redirects to the app view if persisting was successful" do
      expect(@recipe).to receive(:save).and_return(true)
      post :create, params: { recipe: { title: "Reis mit Pilzgulasch" } }
      expect(response).to redirect_to("/#{@recipe.id}")
    end

    it "renders app new view if persisting failed" do
      expect(@recipe).to receive(:save).and_return(false)
      post :create, params: { recipe: { title: "Reis mit Pilzgulasch" } }
      expect(response).to render_template(:new)
    end
  end

  describe "#delete" do
    before do
      @user = User.create(email: "admin@peasbemine.de", password: "LetMeTestThis")
      sign_in @user

      @recipe = Recipe.create(title: "Reis mit Pilzgulasch")
      expect(Recipe).to receive(:find).and_return(@recipe)
    end

    it "deletes @recipe" do
      expect(@recipe).to receive(:destroy)
      get :delete, params: { id: "" }
      expect(response).to redirect_to(recipe_index_path)
    end
  end
end
