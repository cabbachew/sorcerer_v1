class Source < ApplicationRecord
  validates :name, presence: true

  # Sort by id in descending order
  scope :ordered, -> { order(id: :desc) }
end
