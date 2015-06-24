class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include LanguagesHelper
  include MatchesHelper
  helper_method :next_match

  def next_match
    @next_match ||= session[:next_match]
  end
end
