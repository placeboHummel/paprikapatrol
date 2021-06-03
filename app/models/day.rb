class Day < ApplicationRecord
  belongs_to :recipe, optional: true

  # rails enum for weekdays
end
