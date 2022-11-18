class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:text) * "\n"
  end

  def show
    render plain: @test.questions.find(params[:id]).text
  end

  def new; end

  def create
    @test.questions.new(question_params).save
  end

  def edit; end

  def destroy
    @test.questions.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
