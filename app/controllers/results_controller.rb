class ResultsController < ApplicationController
  before_action :authenticate_user!

  def show
    test
    result
  end

  def index
    project
    test
    @results = Result.for_test(test)
  end

  private

  def result
    @result ||= Result.find(params[:id])
  end

  def project
    @project ||= Project.find(params[:project_id])
  end

  def test
    @test ||= Test.find(params[:test_id])
  end
end

