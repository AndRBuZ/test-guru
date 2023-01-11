class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complited?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    if new_gist.success?
      @test_passage.current_question.gists.create(user_id: current_user.id, url: result.html_url)
      flash_options = { notice: t('.success') + "  #{result.html_url}" }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
