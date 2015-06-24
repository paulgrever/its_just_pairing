class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include LanguagesHelper
  include MatchesHelper
  before_filter :require_login , :out_of_matches
  helper_method :next_potential_match, :pending_matches, :list_of_likes

  def next_potential_match
    @liked ||= list_of_likes
    if @liked.count > 0
      @liked.first.person_a.to_i
    else
      dont_match_with_yourself
      dont_match_with_rejects
      dont_match_with_matches
      upcoming_match
    end
  end

private
  def require_login
    unless current_user
      redirect_to home_index_path
    end
  end
end
