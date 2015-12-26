class TestsController < ApplicationController
  before_action :authenticate_user!
  def new
    @test = Test.new
    project
    byebug
  end

  def create
    @test = Test.new(test_params.merge(project: project))
    if test.save
      redirect_to project_test_path(project, test)
    else
      render :new
    end
  end

  def show
    project
    test
  end

  def run
    ApiBombRunnerContext.new(test).run
    redirect_to project_test_path(project, test)
  end

  private

  def test
    @test ||= Test.find(params[:id])
  end

  def project
    @project ||= Project.find(params[:project_id])
  end

  def test_params
    params.require(:test).permit(:name, :concurrent_users, :duration, :path, :headers, :params, :body)
  end
end

