class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include LanguagesHelper
  include MatchesHelper
  helper_method :change_up, :pending_matches, :list_of_likes
  attr_reader :liked

  def change_up
    @liked ||= Match.pending.where(person_b: current_user)
    if @liked.count > 0
      @liked.first.person_a.to_i
    else
      if session[:next_match] > current_user.next_match 
        session[:next_match]
      else
        session[:next_match] = current_user.next_match 
      end
    end
  end

  def list_of_likes
    Match.pending.where(person_b: current_user)
  end

  def pending_matches
    Match.pending.where(person_b: current_user).count > 0
  end

end
