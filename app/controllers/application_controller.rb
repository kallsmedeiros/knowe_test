class ApplicationController < ActionController::Base
   before_action :load_user
   protect_from_forgery with: :exception
  def index
  end

  def load_user
    if session[:usuario_id]
      @online = Usuario.find(session[:usuario_id])
    end
  end

  def logout
    reset_session
    redirect_to :controller => '/login', :action => 'index'
  end
end

