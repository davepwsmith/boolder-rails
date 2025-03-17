class PagesController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session
  def app
  end

  def privacy
  end

  def about
  end

  def contribute
  end
end
