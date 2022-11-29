class TestsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
