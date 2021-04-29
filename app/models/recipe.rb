class Recipe < ApplicationRecord
  has_many :days
  has_one_attached :main_image
  has_rich_text :description
  has_one :action_text_rich_text, class_name: "ActionText::RichText", as: :record
end
