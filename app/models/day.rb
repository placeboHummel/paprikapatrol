class Day < ApplicationRecord
  belongs_to :recipe, optional: true
end
