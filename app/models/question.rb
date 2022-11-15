class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, presence: true
end
