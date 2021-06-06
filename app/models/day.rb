class Day < ApplicationRecord
  belongs_to :recipe, optional: true

  # rails enum for weekdays
  def self.reset_plan
    Day.all.each do |day|
      day.update(recipe_id: nil)
    end
  end
end
