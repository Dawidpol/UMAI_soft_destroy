class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_author
    @author = Author.find(params[:author_id])
  end
end
