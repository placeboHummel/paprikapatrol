require "rails_helper"

describe DayController do
  describe "routing" do
    it "works" do
      expect(get: "/day").to route_to(controller: "day", action: "index")
      expect(get: "/day/new").to route_to(controller: "day", action: "new")
      expect(post: "/day/new").to route_to(controller: "day", action: "create")
      expect(get: "/day/10/edit").to route_to(controller: "day", action: "edit", id: "10")
      expect(patch: "day/10/edit").to route_to(controller: "day", action: "update", id: "10")
      expect(get: "day/10").to route_to(controller: "day", action: "show", id: "10")
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

    it "assigns @day" do
      get :new
      expect(assigns[:day]).to be_a(Day)
    end
  end

  describe "#create" do
    before do
      @user = User.create(email: "admin@peasbemine.de", password: "LetMeTestThis")
      sign_in @user

      @recipe = Recipe.create(title: "Gulasch mit Klöße")
      @day = Day.create(name: "Dienstag Abend", recipe_id: @recipe.id)
      expect(Day).to receive(:new).and_return(@day)
    end

    it "assigns @day" do
      post :create, params: { day: { name: "Dienstag Abend", recipe_id: @recipe.id } }
      expect(assigns[:day]).to be_a(Day)
    end

    it "saves the day" do
      expect(@day).to receive(:save).and_return(true)
      post :create, params: { day: { name: "Dienstag Abend", recipe_id: @recipe.id } }
    end

    it "redirects to the weekly view if persisting was successful" do
      expect(@day).to receive(:save).and_return(true)
      post :create, params: { day: { name: "Dienstag Abend", recipe_id: @recipe.id } }
      expect(response).to redirect_to(day_index_path)
    end

    it "renders recipe new view if persisting failed" do
      expect(@day).to receive(:save).and_return(false)
      post :create, params: { day: { name: "Dienstag Abend", recipe_id: @recipe.id } }
      expect(response).to render_template(:new)
    end
  end
end
