class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:text) * "\n"
  end

  def show
    render plain: @question.text
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
