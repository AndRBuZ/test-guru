class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :gists

  validates :text, presence: true
end
