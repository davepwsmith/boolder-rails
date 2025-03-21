class RedirectsController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session
  def new
    if problem_id = params[:problem_id]
      redirect_to helpers.problem_friendly_path(Problem.find(problem_id))
    elsif area_id = params[:area_id]
      redirect_to area_path(Area.find(area_id))
    else
      redirect_to root_localized_path
    end
  end
end
