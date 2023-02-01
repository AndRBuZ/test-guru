class Badge < ApplicationRecord
  RULES = %i[first level category].freeze

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, :img_name, :rule, presence: true
end
