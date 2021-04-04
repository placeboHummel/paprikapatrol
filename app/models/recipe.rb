class Recipe < ApplicationRecord
  has_many :days
  has_one_attached :main_image
  has_rich_text :description
end
