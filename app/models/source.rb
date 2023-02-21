class Source < ApplicationRecord
  belongs_to :team

  validates :name, presence: true

  # Sort by id in descending order
  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_later_to "sources", partial: "sources/source", locals: { source: self }, target: "sources" }
  after_update_commit -> { broadcast_replace_later_to "sources", partial: "sources/source", locals: { source: self }, target: "source_#{self.id}" }
  after_destroy_commit -> { broadcast_remove_to "sources", target: "source_#{self.id}" }
end
