class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include LanguagesHelper
  include MatchesHelper
  before_filter :require_login , :out_of_matches
  helper_method :next_potential_match, :pending_matches, :list_of_likes
  attr_reader :liked

  def next_potential_match
    @liked ||= Match.pending.where(person_b: current_user)
    if @liked.count > 0
      @liked.first.person_a.to_i
    else
      dont_match_with_yourself
      upcoming_match
    end
  end

  def list_of_likes
    Match.pending.where(person_b: current_user)
  end

private
  def dont_match_with_yourself
    if (session[:next_match] == current_user.id) || current_user.next_match == current_user.id
      session[:next_match] += 1
    end
  end

  def upcoming_match
    if session[:next_match] > current_user.next_match
      session[:next_match]
    else
      session[:next_match] = current_user.next_match
    end
  end

  def out_of_matches
    if session[:next_match] > User.last.id
      redirect_to matches_path
    end
  end

  def require_login
    unless current_user
      redirect_to home_index_path
    end
  end

end
