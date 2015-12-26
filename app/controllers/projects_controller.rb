class ProjectsController < ApplicationController
  before_action :authenticate_user!

	def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params.merge(user: current_user))
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.for_user(current_user)
  end

  private

    def project_params
      params.require(:project).permit(:name, :base_url, :user_id)
    end
end

