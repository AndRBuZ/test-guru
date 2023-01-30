class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, :img_name, :rule, presence: true

  RULES = %i[first level category].freeze
end
