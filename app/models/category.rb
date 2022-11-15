class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, presence: true

  scope :sorted_categories, -> { order(title: :ASC) }
end
