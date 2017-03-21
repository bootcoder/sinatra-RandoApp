helpers do

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
    # @current_user ||= User.find_by(id: session[:id]) if session[:id]
    # @current_user ||= User.find_by_id(session[:id]) if session[:id]
    # @current_user ||= User.where(id: session[:id]).first if session[:id]
  end

  def logged_in?
    !!current_user
  end

end
