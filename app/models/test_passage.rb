class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_qustion

  SUCCESS_RATIO = 85

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    save!
  end

  def succeeded?
    correct_percent >= SUCCESS_RATIO
  end

  def correct_percent
    correct_questions.to_f * 100 / test.questions.count
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  private

  def before_validation_set_current_qustion
    self.current_question = next_question
  end

  def correct_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
