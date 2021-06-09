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
end
