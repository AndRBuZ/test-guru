class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:id])
    @new_gist = GistQuestionService.new(@test_passage.current_question).call
    @test_passage.current_question.gists.create!(user_id: current_user.id, url: @new_gist.url)

    if @new_gist.success?
      flash_options = { notice: t('.success', url: @new_gist.url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end
end
