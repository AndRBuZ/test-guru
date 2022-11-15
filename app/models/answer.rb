class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_answers_limit

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    errors.add(:answer, "Max answers for one questions is 4") if question.answers.count >= 4
  end
end
