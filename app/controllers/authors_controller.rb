class AuthorsController < ActionController::Base
  before_action :authenticate_author!

  layout 'authors'
end
