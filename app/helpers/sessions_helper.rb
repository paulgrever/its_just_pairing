module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    binding.pry
  end

  def next_match
    @next_match ||=  current_user.next_match
  end
end