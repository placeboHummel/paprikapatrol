require "rails_helper"

describe RecipeController do
  describe "routing" do
    it "works" do
      expect(get: "/recipe").to route_to(controller: "recipe", action: "index")
    end
  end
end
