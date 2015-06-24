class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include LanguagesHelper
  include MatchesHelper
  before_filter :require_login
  helper_method :next_potential_match, :pending_matches, :list_of_likes
  attr_reader :liked

  def next_potential_match
    @liked ||= Match.pending.where(person_b: current_user)
    if @liked.count > 0
      @liked.first.person_a.to_i
    else
      upcoming_match
    end
  end

  def list_of_likes
    Match.pending.where(person_b: current_user)
  end

private

  def upcoming_match
    if session[:next_match] > current_user.next_match
      session[:next_match]
    else
      session[:next_match] = current_user.next_match
    end
  end

  def require_login
    unless current_user
      redirect_to home_index_path
    end
  end

end
