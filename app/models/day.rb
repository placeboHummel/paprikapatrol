class Day < ApplicationRecord
  belongs_to :recipe, optional: true

  # rails enum for weekdays
  def self.reset_plan
    Day.all.each do |day|
      day.update(recipe_id: nil)
    end
  end

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
