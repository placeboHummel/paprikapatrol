require "rails_helper"

RSpec.describe "root path", type: :system do
  describe "searchbar" do
    it "has a search bar" do
      visit root_path
      expect(page).to have_css("#recipe_search")
    end

    it "does the search and render the result" do
      visit root_path
      within "#recipe_search" do
        find(".input").set("Reis").native.send_keys(:return)
      end
      expect(page).to have_text("Reisnudelsalat mit gebackenem Tofu")
    end
  end
end
