class Recipe < ApplicationRecord
  has_many :days
  has_one_attached :main_image
  has_rich_text :description
  has_one :action_text_rich_text, class_name: "ActionText::RichText", as: :record

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end

  def main_image_show
    main_image.attached? ? main_image.variant(resize_to_limit: [700, 550]) : "placeholder.png"
  end

  def main_image_home
    main_image.attached? ? main_image.variant(resize_to_limit: [450, 450]) : "placeholder.png"
  end

  def main_image_all_recipes
    main_image.attached? ? main_image.variant(resize_to_limit: [350, 350]) : "placeholder_small.png"
  end

  def description_or_progress
    description.blank? ? '<p style="text-align:center;"><img src="https://i.imgur.com/p5BC0l2.gif"></p>'.html_safe : description
  end

  def self.reorder_in_progress
    Recipe.all.each do |recipe|
      if recipe.description.blank?
        recipe.update(updated_at: 1.year.ago)
      else
      end
    end
  end
end
