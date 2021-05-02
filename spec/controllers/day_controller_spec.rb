require "rails_helper"

describe DayController do
  describe "routing" do
    it "works" do
      expect(get: "/day").to route_to(controller: "day", action: "index")
    end
  end
end
