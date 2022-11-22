module QuestionsHelper
  def question_header
    if @question.persisted?
      "Edit #{@question.test.title} Questions"
    else
      "Create New #{@question.test.title} Questions"
    end
  end
end
