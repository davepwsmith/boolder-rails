class ArticlesController < ApplicationController
  allow_unauthenticated_access
  before_action :resume_session
end
