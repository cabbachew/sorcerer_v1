class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :sources, dependent: :destroy

  validates :name, presence: true
end
