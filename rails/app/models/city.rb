class City < ApplicationRecord
  belongs_to :state
  validates :name, presence: true
end
